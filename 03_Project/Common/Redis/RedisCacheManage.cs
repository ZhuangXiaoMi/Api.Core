using Microsoft.Extensions.Options;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Common
{
    public class RedisCacheManage : IRedisCacheManage
    {
        #region 全局变量
        private static IOptions<AppSettingsJson> _appSettingsJson;
        //volatile：修饰变量，保证变量在所有线程中同步，值唯一
        private static volatile ConnectionMultiplexer _redisConnection = null;
        private static readonly object _redisConnectionLock = new object();
        private static IDatabase _database;
        private static readonly object _redisDatabaseLock = new object();
        ////单例模式：https://www.cnblogs.com/leolion/p/10241822.html
        //private static readonly Lazy<IDatabase> _lazyDatabase = new Lazy<IDatabase>(() => _redisConnection.GetDatabase(_appSettingsJson.Value.RedisCache.DatabaseId));
        //public static IDatabase _database
        //{
        //    get { return _lazyDatabase.Value; }
        //}

        private RedisValue _token = Environment.MachineName;
        #endregion 全局变量

        #region 构造函数、全局变量初始化
        public RedisCacheManage(IOptions<AppSettingsJson> appSettingsJson)
        {
            _appSettingsJson = appSettingsJson;
            if (string.IsNullOrWhiteSpace(_appSettingsJson.Value.AppSettings.RedisCacheAOP.ConnectionString))
            {
                throw new ArgumentException("redis config is empty", nameof(_appSettingsJson.Value.AppSettings.RedisCacheAOP.ConnectionString));
            }
            _redisConnection = GetRedisConnection();
        }

        /// <summary>
        /// 核心代码，获取连接实例
        /// 单例模式：https://www.cnblogs.com/leolion/p/10241822.html
        /// </summary>
        /// <returns></returns>
        public ConnectionMultiplexer GetRedisConnection()
        {
            if (_redisConnection == null)
            {
                lock (_redisConnectionLock)
                {
                    if (_redisConnection == null)
                    {
                        try
                        {
                            var config = new ConfigurationOptions
                            {
                                AbortOnConnectFail = false,
                                AllowAdmin = true,
                                ConnectTimeout = 15000,//15s
                                SyncTimeout = 5000,
                                //Password = "Pwd",//Redis数据库密码
                                EndPoints = { _appSettingsJson.Value.AppSettings.RedisCacheAOP.ConnectionString }//格式：IP:Port，如“192.168.2.110:6379”
                            };
                            _redisConnection = ConnectionMultiplexer.Connect(config);
                        }
                        catch (Exception ex)
                        {
                            //throw new Exception("Redis服务未开启，请注意配置文件端口号。");
                        }
                    }
                }
            }

            return _redisConnection;
        }
        public IDatabase GetDatabase()
        {
            if (_database == null)
            {
                lock (_redisDatabaseLock)
                {
                    if (_database == null)
                    {
                        if (_appSettingsJson.Value.AppSettings.RedisCacheAOP.DatabaseId > 0)
                        {
                            _database = _redisConnection.GetDatabase(_appSettingsJson.Value.AppSettings.RedisCacheAOP.DatabaseId);
                        }
                        else
                        {
                            _database = _redisConnection.GetDatabase();
                        }
                    }
                }
            }
            return _database;
        }
        public IServer GetServer() => _redisConnection.GetServer(_redisConnection.GetEndPoints()[0]);
        #endregion 构造函数、全局变量初始化

        #region 接口
        /// <summary>
        /// 是否存在
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public async Task<bool> ExistsAsync(string key) => await GetDatabase().KeyExistsAsync(key);

        /// <summary>
        /// 增加/修改
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="expireTime"></param>
        public async Task<bool> SetAsync(string key, dynamic value, TimeSpan? expireTime = null)
        {
            if (!expireTime.HasValue)
            {
                expireTime = TimeSpan.FromSeconds(120);
            }

            return await GetDatabase().StringSetAsync(key, value, expireTime);
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public async Task<bool> DeleteAsync(string key) => await GetDatabase().KeyDeleteAsync(key);

        /// <summary>
        /// 获取连接数
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public async Task<long> GetCountAsync(string key) => await GetDatabase().SetLengthAsync(key);

        /// <summary>
        /// 获取值
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public async Task<string> GetAsync(string key) => await GetAsync<string>(key);

        /// <summary>
        /// 获取值
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        public async Task<TEntity> GetAsync<TEntity>(string key)
        {
            var value = await GetDatabase().StringGetAsync(key);
            if (value.HasValue)
            {
                return SerializeHelper.Deserialize<TEntity>(value);
            }
            else
            {
                return default(TEntity);
            }
        }

        /// <summary>
        /// 根据值的正则，获取Keys
        /// </summary>
        /// <param name="pattern">xxx_*</param>
        /// <returns></returns>
        public IEnumerable<string> GetKeys(string pattern) =>
            GetServer()
                .Keys(_appSettingsJson.Value.AppSettings.RedisCacheAOP.DatabaseId, pattern, int.MaxValue)
                .Select(p => p.ToString());

        /// <summary>
        /// Hash 增加/修改
        /// </summary>
        /// <param name="key"></param>
        /// <param name="hashField"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public async Task<bool> HashSetAsync(string key, string hashField, dynamic value) =>
            await GetDatabase().HashSetAsync(key, hashField, value);

        /// <summary>
        /// 删除 Hash
        /// </summary>
        /// <param name="key"></param>
        /// <param name="hashField"></param>
        /// <returns></returns>
        public async Task<bool> HashDeleteAsync(string key, string hashField) =>
            await GetDatabase().HashDeleteAsync(key, hashField);

        /// <summary>
        /// 获取 Hash 值
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public async Task<IEnumerable<dynamic>> GetHashsAsync(string key)
        {
            var hashs = await GetDatabase().HashGetAllAsync(key);
            var dynamicList = hashs.Select(p => new
            {
                hashField = p.Name.ToString(),
                value = p.Value.ToString()
            });
            return dynamicList;
        }

        /// <summary>
        /// 清除
        /// </summary>
        public async Task Clear()
        {
            foreach (var endPoint in this.GetRedisConnection().GetEndPoints())
            {
                var server = this.GetRedisConnection().GetServer(endPoint);
                //await server.FlushDatabaseAsync(_appSettingsJson.Value.RedisCache.DatabaseId);

                foreach (var key in server.Keys(_appSettingsJson.Value.AppSettings.RedisCacheAOP.DatabaseId, pattern: "*", int.MaxValue))
                {
                    await GetDatabase().KeyDeleteAsync(key);

                    //var hashs = await GetDatabase().HashGetAllAsync(key);
                    //foreach (var item in hashs)
                    //{
                    //    await GetDatabase().HashDeleteAsync(key, item.Name);
                    //}
                }
            }
        }
        #endregion 接口
    }
}
