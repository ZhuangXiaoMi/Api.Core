﻿using SqlSugar;
using System;
using System.IO;
using System.Linq;
using System.Reflection;

namespace Repository.SqlSugar
{
    public class DbContext
    {
        #region 属性
        /// <summary>
        /// 数据库连接字符串
        /// </summary>
        public static string ConnectionString { get; set; }

        /// <summary>
        /// 数据库类型
        /// </summary>
        public static DbType DbType { get; set; }

        /// <summary>
        /// 数据库连接对象
        /// </summary>
        public SqlSugarClient Db { get; private set; }

        /// <summary>
        /// 数据库上下文实例（自动关闭连接）
        /// 在内存中保存一个SqlSugarClient实例（SqlSugarClient对象不能静态定义）
        /// </summary>
        public static DbContext Context
        {
            get
            {
                return new DbContext();
            }
        }
        #endregion 属性

        #region 构造函数
        /// <summary>
        /// 初始化静态变量
        /// </summary>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <param name="dbType">数据库类型</param>
        public static void Init(string connectionString, DbType dbType = DbType.SqlServer)
        {
            ConnectionString = connectionString;
            DbType = dbType;
        }

        private DbContext(bool isAutoCloseConnection = true)
        {
            if (string.IsNullOrEmpty(ConnectionString)) throw new ArgumentNullException("数据库连接字符串为空！");

            Db = new SqlSugarClient(new ConnectionConfig()
            {
                ConnectionString = ConnectionString,
                DbType = DbType,
                //InitKeyType = InitKeyType.Attribute,//从特性读取主键和自增列信息
                IsAutoCloseConnection = isAutoCloseConnection,
                MoreSettings = new ConnMoreSettings()
                {
                    IsWithNoLockQuery = true,
                    IsAutoRemoveDataCache = true
                }
            });

            //调式代码，打印SQL
            Db.Aop.OnLogExecuting = (sql, pars) =>
            {
                Console.WriteLine(sql + "\r\n" +
                    Db.Utilities.SerializeObject(pars.ToDictionary(it => it.ParameterName, it => it.Value)));
                Console.WriteLine();
            };

        }

        /// <summary>
        /// 获取DbContext
        /// </summary>
        /// <param name="isAutoCloseConnection">是否自动关闭连接</param>
        /// <returns></returns>
        public static DbContext GetDbContext(bool isAutoCloseConnection = true) => new DbContext(isAutoCloseConnection);
        #endregion 构造函数

        #region 获取实体上下文
        /// <summary>
        /// 获取实体上下文
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public SimpleClient<T> GetEntityContext<T>() where T : class, new()
        {
            return new SimpleClient<T>(Db);
        }
        /// <summary>
        /// 获取实体上下文
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="db"></param>
        /// <returns></returns>
        public SimpleClient<T> GetEntityContext<T>(SqlSugarClient db) where T : class, new()
        {
            return new SimpleClient<T>(db);
        }
        #endregion 获取实体上下文

        #region 根据数据库表生成实体类
        /// <summary>
        /// 根据数据库表生成实体类
        /// InitKeyType.SystemTable
        /// </summary>
        /// <param name="classPath">实体类文件生成路径</param>
        /// <param name="nameSpace">命名空间</param>
        /// <param name="arrTableName">生成指定表</param>
        public void CreateEntityByDBT(string classPath, string nameSpace, string[] arrTableName = null)
        {
            var DB = Db.DbFirst;
            if (arrTableName != null && arrTableName.Length > 0)
            {
                DB = DB.Where(arrTableName);
            }
            DB.IsCreateAttribute().IsCreateDefaultValue()
                .SettingClassTemplate(p => p)
                .SettingNamespaceTemplate(p => p)
                .SettingPropertyTemplate(p => p)
                .SettingPropertyDescriptionTemplate(p => p)
                .SettingConstructorTemplate(p => p)
                .CreateClassFile(classPath, nameSpace);
        }
        #endregion 根据数据库表生成实体类

        #region 根据实体类生成数据库表
        /// <summary>
        /// 根据实体类生成数据库表
        /// InitKeyType.Attribute
        /// </summary>
        /// <param name="isBackupTable">是否备份表</param>
        public void CreateDBTByEntity(bool isBackupTable)
        {
            string entityPath = Path.Combine(Environment.CurrentDirectory, "Entity.dll");//dll绝对路径
            Assembly assembly = Assembly.LoadFrom(entityPath);
            //Type type = assembly.GetType("Entity.ClassName");//写法：程序集.类名
            //MethodInfo method = type.GetMethod("MethodName");//获取类中的公共方法
            //dynamic instance = System.Activator.CreateInstance(type);//创建对象的实例
            //dynamic result = method.Invoke(instance, new object[] { });//执行方法，new object[] { }为方法提供参数
            Type[] arrEntityTypes = assembly.GetTypes()
                .Where(type => !string.IsNullOrEmpty(type.Namespace))
                .ToArray();

            CreateDBTByEntity(isBackupTable, arrEntityTypes);
        }
        /// <summary>
        /// 根据实体类生成数据库表
        /// InitKeyType.Attribute
        /// </summary>
        /// <param name="isBackupTable">是否备份表</param>
        /// <param name="arrEntityTypes">指定实体</param>
        public void CreateDBTByEntity(bool isBackupTable, params Type[] arrEntityTypes)
        {
            var DB = Db.CodeFirst;
            if (isBackupTable)
            {
                DB = DB.BackupTable();
            }
            DB.InitTables(arrEntityTypes);
        }
        #endregion 根据实体类生成数据库表

    }
}
