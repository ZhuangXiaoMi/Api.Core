using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace Common
{
    #region appsettings.json节点
    [Serializable]
    public class DbInfoConfig
    {
        [JsonProperty("DbType")]
        public DbType DbType { get; set; }
        public bool Enabled { get; set; }
        public string ConnectionString { get; set; }
        public string ProviderName { get; set; }
    }

    /// <summary>
    /// JWT设置
    /// </summary>
    public class JwtTokenAuthConfig
    {
        /// <summary>
        /// 发行者：表示token是谁颁发的
        /// </summary>
        public string Issuer { get; set; }
        /// <summary>
        /// 表示哪些客户端可以使用这个token
        /// </summary>
        public string Audience { get; set; }
        /// <summary>
        /// 加密的Key，必须大于16位
        /// </summary>
        public string Secret { get; set; }
    }

    public class CacheConfig
    {
        public bool Enabled { get; set; }
        public string ConnectionString { get; set; }
        public int DatabaseId { get; set; }
    }

    public class DBMConfig
    {
        public IList<DbInfoConfig> MySql { get; set; }
        public IList<DbInfoConfig> SqlServer { get; set; }
        public IList<DbInfoConfig> Sqlite { get; set; }
        public IList<DbInfoConfig> Oracle { get; set; }
    }
    public class AppSettingsConfig
    {
        public CacheConfig RedisCacheAOP { get; set; }
        public CacheConfig MemoryCacheAOP { get; set; }
        public CacheConfig LogAOP { get; set; }
        public CacheConfig TranAOP { get; set; }
        public CacheConfig SqlAOP { get; set; }
    }
    public class AppSettingsJson
    {
        public AppSettingsConfig AppSettings { get; set; }
        public DBMConfig DBM { get; set; }
        public JwtTokenAuthConfig Audience { get; set; }
    }
    #endregion appsettings.json节点
}
