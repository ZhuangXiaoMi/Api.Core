using Microsoft.Extensions.DependencyInjection;
using System;

namespace Common
{
    /// <summary>
    /// SqlSugar 启动服务
    /// </summary>
    public static class SqlSugarService
    {
        public static void AddSqlSugarService(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            //services.AddScoped<SqlSugar.ISqlSugarClient>(o =>
            //{
            //    var dbContext = new SqlSugar.SqlSugarClient(new SqlSugar.ConnectionConfig()
            //    {
            //        ConnectionString = DbFactory.DbConnection,//必填，数据库连接字符串
            //        DbType = (SqlSugar.DbType)DbFactory.DbType,//必填，数据库类型
            //        IsAutoCloseConnection = true,//默认false，自动关闭数据库连接，true无需使用using或Close操作
            //        InitKeyType = SqlSugar.InitKeyType.SystemTable//默认SystemTable，字段信息读取，如：该属性是不是主键，标识列等信息
            //    });
            //    return dbContext;
            //});
        }
    }
}
