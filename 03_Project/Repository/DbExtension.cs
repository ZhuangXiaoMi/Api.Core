using Common;
using Entity;
using IRepository;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.Extensions.Options;
using Repository.EF;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

namespace Repository
{
    public class DbExtension
    {
        private static ApiDbContext _apiDbContext;
        private static IUnitOfWork _unitOfWork;
        private static IOptions<AppSettingsJson> _appSettingsJson;

        public DbExtension(ApiDbContext apiDbContext, IUnitOfWork unitOfWork, IOptions<AppSettingsJson> appSettingsJson)
        {
            _apiDbContext = apiDbContext;
            _unitOfWork = unitOfWork;
            _appSettingsJson = appSettingsJson;
        }

        /// <summary>
        /// 获取数据库一个表的所有属性值及属性描述
        /// </summary>
        /// <param name="moduleName">模块名称/表名</param>
        /// <returns></returns>
        public List<KeyDescription> GetProperties(string moduleName)
        {
            var result = new List<KeyDescription>();
            var entity = _apiDbContext.Model.GetEntityTypes().FirstOrDefault(p => p.Name.ToLower().Equals(moduleName.ToLower()));
            if (entity == null)
            {
                throw new Exception($"未能找到{moduleName}对应的实体类");
            }

            foreach (var property in entity.ClrType.GetProperties())
            {
                object[] objs = property.GetCustomAttributes(typeof(DescriptionAttribute), true);
                object[] browsableObjs = property.GetCustomAttributes(typeof(BrowsableAttribute), true);
                var description = objs.Length > 0 ? ((DescriptionAttribute)objs[0]).Description : property.Name;
                if (string.IsNullOrEmpty(description)) description = property.Name;
                //如果没有BrowsableAttribute或 [Browsable(true)]表示可见，其他均为不可见，需要前端配合显示
                bool browsable = browsableObjs == null || browsableObjs.Length == 0 || ((BrowsableAttribute)browsableObjs[0]).Browsable;
                var typeName = property.PropertyType.Name;
                if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                {
                    typeName = Nullable.GetUnderlyingType(property.PropertyType).Name;
                }

                result.Add(new KeyDescription
                {
                    key = property.Name,
                    description = description,
                    browsable = browsable,
                    type = typeName
                });
            }

            return result;
        }

        /// <summary>
        /// 获取数据库DbContext中所有的实体名称
        /// 注意：并不能获取数据库中的所有表
        /// </summary>
        /// <returns></returns>
        public List<string> GetDbEntityNames()
        {
            var names = new List<string>();
            var model = _apiDbContext.Model;

            // Get all the entity types information contained in the DbContext class, ...
            var entityTypes = model.GetEntityTypes();
            foreach (var entityType in entityTypes)
            {
                var tableNameAnnotation = entityType.GetAnnotation("Relational:TableName");
                names.Add(tableNameAnnotation.Value.ToString());
            }

            return names;
        }

        /// <summary>
        /// 获取MySql表结构信息
        /// </summary>
        /// <param name="tableName"></param>
        private void GetMySqlStructure(string tableName)
        {
            var sql = $@"SELECT DISTINCT
	                        column_name,'{tableName}' AS table_name,column_comment,data_type
	                        ,CASE WHEN data_type IN ('BIT','BOOL','bit','bool') THEN 'bool'
		                        WHEN data_type IN ('SMALLINT','smallint') THEN 'short'
		                        WHEN data_type IN ('TINYINT','tinyint') THEN 'bool'
		                        WHEN data_type IN ('MEDIUMINT','mediumint','INT','int','Year', 'year') THEN 'int'
		                        WHEN data_type IN ('BIGINT','bigint') THEN 'bigint'
		                        WHEN data_type IN ('FLOAT','DOUBLE','DECIMAL','float','double','decimal') THEN 'decimal'
		                        WHEN data_type IN ('CHAR','VARCHAR','TINY TEXT','TEXT','MEDIUMTEXT','LONGTEXT','TINYBLOB','BLOB','MEDIUMBLOB','LONGBLOB','Time','char','varchar','tiny text','text','mediumtext','longtext','tinyblob','blob','mediumblob','longblob','time') THEN 'string'
		                        WHEN data_type IN('Date', 'DateTime', 'TimeStamp','date', 'datetime', 'timestamp') THEN 'DateTime' 
		                        ELSE 'string' END AS entity_type
	                        ,CASE WHEN CHARACTER_MAXIMUM_LENGTH > 8000 THEN 0 ELSE CHARACTER_MAXIMUM_LENGTH END AS max_length
	                        ,CASE WHEN COLUMN_KEY <> '' THEN 1 ELSE 0 END AS is_key
	                        ,CASE WHEN column_name IN ('CreateID','ModifyID','') OR COLUMN_KEY <> '' THEN 0 ELSE 1 END AS is_display
	                        ,CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS Is_Null
	                        ,CASE WHEN COLUMN_KEY <> '' THEN 1 ELSE 0 END AS is_read_dataset
                        FROM INFORMATION_SCHEMA.COLUMNS
                        WHERE table_name = '{tableName}' {GetMySqlTableSchema()}";

            var columns = _unitOfWork.FromSql<SysMenu>(sql);
        }

        /// <summary>
        /// 获取MySql当前数据库名称
        /// </summary>
        /// <returns></returns>
        private string GetMySqlTableSchema()
        {
            try
            {
                string dbName = _apiDbContext.Database.GetDbConnection().ConnectionString.Split("Database=")[1].Split(";")[0]?.Trim();
                if (!string.IsNullOrEmpty(dbName))
                {
                    dbName = $" and table_schema = '{dbName}' ";
                }
                return dbName;
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        /// <summary>
        /// 获取SqlServer表结构信息
        /// </summary>
        /// <param name="tableName"></param>
        private void GetSqlServerStructure(string tableName)
        {
            var sql = $@"SELECT table_name,LTRIM(RTRIM(column_name)) AS column_name,comment,
	                        CASE WHEN column_type = 'uniqueidentifier' THEN 'guid'
		                        WHEN column_type IN ('smallint','INT') THEN 'int'
		                        WHEN column_type = 'BIGINT' THEN 'long'
		                        WHEN column_type IN ('CHAR','VARCHAR','NVARCHAR','text','xml','varbinary','image') THEN 'string'
		                        WHEN column_type IN ('tinyint') THEN 'byte'
		                        WHEN column_type IN ('bit') THEN 'bool'
		                        WHEN column_type IN ('bit') THEN 'bool'
		                        WHEN column_type IN ('time','date','DATETIME','smallDATETIME') THEN 'DateTime'
		                        WHEN column_type IN('smallmoney','DECIMAL','numeric','money') THEN 'decimal'
		                        WHEN column_type = 'float' THEN 'float'
		                        ELSE 'string' END AS entity_type
	                        ,column_type,max_length,is_key,t.is_null
	                        ,CASE WHEN ColumnName IN ('CreateID','ModifyID','') OR is_key = 1 THEN 0 ELSE 1 END AS is_display
	                        ,CASE WHEN is_key = 1 THEN 1 ELSE 0 END is_read_dataset
	                        ,CASE WHEN is_key != 1 AND t.is_null = 0 THEN 0 ELSE NULL END AS edit_col_no
                        FROM (
	                        SELECT obj.name AS table_name,col.name AS column_name,t.name AS column_type,
	                        CONVERT(NVARCHAR(100),ISNULL(ep.[value], '')) AS comment,
	                        CASE WHEN col.length<1 THEN 0 ELSE col.length END AS max_length,
	                        CASE WHEN EXISTS (
		                        SELECT 1
		                        FROM dbo.sysindexes si
		                        INNER JOIN dbo.sysindexkeys sik ON si.id = sik.id AND si.indid = sik.indid
		                        INNER JOIN dbo.syscolumns sc ON sc.id = sik.id AND sc.colid = sik.colid
		                        INNER JOIN dbo.sysobjects so ON so.name = si.name AND so.xtype = 'PK'
		                        WHERE sc.id = col.id AND sc.colid = col.colid
		                        )	
		                        THEN 1 ELSE 0 END AS is_key,
	                        CASE WHEN col.isnullable = 1 THEN 1 ELSE 0 END AS is_null,col.colorder
	                        FROM dbo.syscolumns col
	                        LEFT JOIN dbo.systypes t ON col.xtype = t.xusertype
	                        INNER JOIN dbo.sysobjects obj ON col.id = obj.id AND obj.xtype IN ('U','V')
	                        LEFT JOIN dbo.syscomments comm ON col.cdefault = comm.id
	                        LEFT JOIN sys.extended_properties ep ON col.id = ep.major_id AND col.colid = ep.minor_id AND ep.name = 'MS_Description'
	                        LEFT JOIN sys.extended_properties epTwo ON obj.id = epTwo.major_id AND epTwo.minor_id = 0 AND epTwo.name = 'MS_Description'
	                        WHERE obj.name = '{tableName}'
                        ) AS t
                        ORDER BY t.colorder";

            var columns = _unitOfWork.FromSql<SysMenu>(sql);
        }
    }
}
