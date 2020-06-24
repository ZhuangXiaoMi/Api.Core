using Common;

namespace Factory
{
    public class DbFactory
    {
        public static string DbConnection => InitDbConfig();
        public static Factory.Enum.DbType DbType = Factory.Enum.DbType.SqlServer;

        private static string _dbType = AppSettingsHelper.GetElement(new string[] { "AppSettings", "DbConfig", "Type" });
        private static string _dbConnection = AppSettingsHelper.GetElement(new string[] { "AppSettings", "DbConfig", "ConnectionString" });

        private static string InitDbConfig()
        {
            switch (_dbType.ToUpper())
            {
                case "MYSQL":
                    DbType = Factory.Enum.DbType.MySql;
                    break;
                case "SQLSERVER":
                    DbType = Factory.Enum.DbType.SqlServer;
                    break;
                case "SQLITE":
                    DbType = Factory.Enum.DbType.Sqlite;
                    break;
                case "ORACLE":
                    DbType = Factory.Enum.DbType.Oracle;
                    break;
            }
            return _dbConnection;
        }
    }
}
