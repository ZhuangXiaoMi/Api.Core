using DTO;
using Entity;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IService
{
    public interface IBaseService<TARoot> where TARoot : ABTAggregateRoot
    {
        #region 读操作
        bool IsExist(Expression<Func<TARoot, bool>> exp);

        int GetCount(Expression<Func<TARoot, bool>> exp = null);

        TARoot FindSingle(Expression<Func<TARoot, bool>> exp = null);

        IQueryable<TARoot> Find(Expression<Func<TARoot, bool>> exp = null);

        IQueryable<TARoot> FindPage(out int total, int pageIndex = 1, int pageSize = 20
            , Expression<Func<TARoot, bool>> exp = null, OrderByDto[] orderParams = null);

        IQueryable<T> FromSql<T>(string sql, params DbParameter[] parames) where T : class;
        #endregion 读操作

        #region 写操作
        #region 事务
        void BeginTransaction();
        Task BeginTransactionAsync();

        void CommitTransaction();
        Task CommitTransactionAsync();

        void RollbackTransaction();
        Task RollbackTransactionAsync();
        #endregion 事务

        #region 执行 SQL 语句
        int ExecuteSql(string sql, params DbParameter[] parames);
        Task<int> ExecuteSqlAsync(string sql, params DbParameter[] parames);

        int ExecuteProc(string procName, params DbParameter[] parames);
        Task<int> ExecuteProcAsync(string procName, params DbParameter[] parames);
        #endregion 执行 SQL 语句

        #region 增删改
        TARoot Add(TARoot entity);
        Task<TARoot> AddAsync(TARoot entity);

        int BatchAdd(IEnumerable<TARoot> entities);
        Task<int> BatchAddAsync(IEnumerable<TARoot> entities);

        int Update(TARoot entity);
        Task<int> UpdateAsync(TARoot entity);

        /// <summary>
        /// 更新部分字段，如：Update(p => p.id = 1, p => new Entity { property = value });
        /// </summary>
        /// <typeparam name="TARoot"></typeparam>
        /// <param name="exp"></param>
        /// <param name="entity"></param>
        int Update(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity);
        Task<int> UpdateAsync(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity);

        int Delete(TARoot entity);
        Task<int> DeleteAsync(TARoot entity);

        int Delete(Expression<Func<TARoot, bool>> exp);
        Task<int> DeleteAsync(Expression<Func<TARoot, bool>> exp);
        #endregion 增删改
        #endregion 写操作
    }
}
