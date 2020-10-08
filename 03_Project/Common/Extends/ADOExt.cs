using Castle.Components.DictionaryAdapter;
using Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Common
{
    public static class ADOExt
    {
        /// <summary>
        /// 获取运行时的Sql
        /// </summary>
        /// <param name="dbCommand"></param>
        /// <returns></returns>
        public static string GetCommandText(this DbCommand dbCommand)
        {
            var sql = dbCommand.CommandText;
            foreach (DbParameter parameter in dbCommand.Parameters)
            {
                try
                {
                    string value = string.Empty;
                    switch (parameter.DbType)
                    {
                        case System.Data.DbType.Date:
                            value = parameter.Value.ParseToDateTime().ToString("yyyy-MM-dd HH:mm:ss");
                            break;
                        default:
                            value = parameter.Value.ParseToString();
                            break;
                    }
                    sql = sql.Replace(parameter.ParameterName, value);
                }
                catch (Exception)
                {

                }
            }
            return sql;
        }

        /// <summary>
        /// 获取实体属性键值对
        /// </summary>
        /// <typeparam name="TARoot"></typeparam>
        /// <param name="entity"></param>
        /// <returns></returns>
        public static Hashtable GetPropertyInfo<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            Hashtable ht = new Hashtable();
            PropertyInfo[] props = entity.GetType().GetProperties();
            foreach (PropertyInfo prop in props)
            {
                bool flag = true;
                foreach (Attribute attr in prop.GetCustomAttributes(true))
                {
                    NotMappedAttribute notMapped = attr as NotMappedAttribute;
                    KeyAttribute key = attr as KeyAttribute;
                    if (notMapped != null)
                    {
                        flag = false;
                        break;
                    }
                    else if (key != null)
                    {
                        flag = false;
                        break;
                    }
                }
                if (flag)
                {
                    string name = prop.Name;
                    object value = prop.GetValue(entity, null);
                    ht[name] = value;
                }
            }
            return ht;
        }

        /// <summary>
        /// 存储过程语句
        /// </summary>
        /// <param name="procName">存储过程名称</param>
        /// <param name="parames">存储过程参数</param>
        /// <returns></returns>
        public static string BuilderProc(string procName, params DbParameter[] parames)
        {
            StringBuilder sql = new StringBuilder("exec " + procName);
            if (parames.Length > 0)
            {
                foreach (var item in parames)
                {
                    sql.Append(" " + item + ",");
                }
                sql = sql.Remove(sql.Length - 1, 1);
            }
            return sql.ToString();
        }

        /// <summary>
        /// 为null属性设置默认值
        /// </summary>
        /// <param name="dbContext"></param>
        public static void SetEntityDefaultValue(DbContext dbContext)
        {
            foreach (EntityEntry entry in dbContext.ChangeTracker.Entries().Where(p => p.State == EntityState.Added || p.State == EntityState.Modified))
            {
                Type type = entry.Entity.GetType();
                PropertyInfo[] props = type.GetProperties();
                foreach (PropertyInfo prop in props)
                {
                    object value = prop.GetValue(entry.Entity, null);
                    if (value == null)
                    {
                        string sType = string.Empty;
                        if (prop.PropertyType.IsGenericType && prop.PropertyType.GenericTypeArguments.Length > 0)
                        {
                            sType = prop.PropertyType.GenericTypeArguments[0].Name;
                        }
                        else
                        {
                            sType = prop.PropertyType.Name;
                        }
                        switch (sType)
                        {
                            case "Boolean":
                                prop.SetValue(entry.Entity, false);
                                break;
                            case "SByte":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "Byte":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "Int16":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "UInt16":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "Int32":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "UInt32":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "Int64":
                                prop.SetValue(entry.Entity, (Int64)0);
                                break;
                            case "UInt64":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "Single":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "Double":
                                prop.SetValue(entry.Entity, 0);
                                break;
                            case "Decimal":
                                prop.SetValue(entry.Entity, (decimal)0);
                                break;
                            case "Char":
                                prop.SetValue(entry.Entity, string.Empty);
                                break;
                            case "String":
                                prop.SetValue(entry.Entity, string.Empty);
                                break;
                            case "DateTime":
                                prop.SetValue(entry.Entity, DateTime.MinValue);
                                break;
                            default:
                                break;
                        }
                    }
                }
            }
        }
    }
}
