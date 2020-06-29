using Common;

namespace Factory
{
    public class DbFactory
    {
        public static string DbConnection => InitDbConfig();
        public static DbType DbType = DbType.SqlServer;

        private static string _dbType = AppSettingsHelper.GetElement(new string[] { "MainDB" });
        private static string _dbConnection = AppSettingsHelper.GetElement(new string[] { "DBM", _dbType, "0", "ConnectionString" });

        private static string InitDbConfig()
        {
            switch (_dbType.ToUpper())
            {
                case "MYSQL":
                    DbType = DbType.MySql;
                    break;
                case "SQLSERVER":
                    DbType = DbType.SqlServer;
                    break;
                case "SQLITE":
                    DbType = DbType.Sqlite;
                    break;
                case "ORACLE":
                    DbType = DbType.Oracle;
                    break;
            }
            return _dbConnection;
        }
    }
}
