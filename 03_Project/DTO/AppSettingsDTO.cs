using Newtonsoft.Json;
using System;

namespace DTO
{
    #region appsettings.json节点
    [Serializable]
    public class DbInfoConfig
    {
        [JsonProperty("Enabled")]
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

    public class RedisCacheConfig
    {
        public bool Enabled { get; set; }
        public string ConnectionString { get; set; }
        public int DatabaseId { get; set; }
    }

    public class AppSettingsConfig
    {
        public DbInfoConfig MySql { get; set; }
        public DbInfoConfig SqlServer { get; set; }
        public DbInfoConfig Sqlite { get; set; }
        public DbInfoConfig Oracle { get; set; }
    }
    public class AppSettingsJson
    {
        public AppSettingsConfig AppSettings { get; set; }
        public JwtTokenAuthConfig Audience { get; set; }
        public RedisCacheConfig RedisCache { get; set; }
        public RedisCacheConfig RedisCacheAOP { get; set; }
        public RedisCacheConfig SignalRRedisCache { get; set; }
    }
    #endregion appsettings.json节点
}
