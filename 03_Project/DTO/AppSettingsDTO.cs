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
    public class JwtTokenAuthConfig
    {
        public string Secret { get; set; }
        public string Issuer { get; set; }
        public string Audience { get; set; }
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
    }
    #endregion appsettings.json节点
}
