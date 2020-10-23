using DTO;
using Entity;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IRepository
{
    /// <summary>
    /// 写操作
    /// </summary>
    public interface IUnitOfWork
    {
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

        #region 同步
        TARoot Add<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot;

        int BatchAdd<TARoot>(IEnumerable<TARoot> entities) where TARoot : ABTAggregateRoot;

        int Update<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot;

        /// <summary>
        /// 更新部分字段，如：Update(p => p.id = 1, p => new Entity { property = value });
        /// </summary>
        /// <typeparam name="TARoot"></typeparam>
        /// <param name="exp"></param>
        /// <param name="entity"></param>
        int Update<TARoot>(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity) where TARoot : ABTAggregateRoot;

        int Delete<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot;

        int Delete<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot;


        bool IsExist<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot;

        int GetCount<TARoot>(Expression<Func<TARoot, bool>> exp = null) where TARoot : ABTAggregateRoot;

        TARoot FindSingle<TARoot>(Expression<Func<TARoot, bool>> exp = null) where TARoot : ABTAggregateRoot;

        IQueryable<TARoot> Find<TARoot>(Expression<Func<TARoot, bool>> exp = null) where TARoot : ABTAggregateRoot;

        IQueryable<TARoot> FindPage<TARoot>(out int total, int pageIndex = 1, int pageSize = 20
            , Expression<Func<TARoot, bool>> exp = null, OrderByDto[] orderParams = null) where TARoot : ABTAggregateRoot;

        IQueryable<T> FromSql<T>(string sql, params DbParameter[] parames) where T : class;
        #endregion 同步

        #region 异步
        Task<TARoot> AddAsync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot;

        Task<int> BatchAddAsync<TARoot>(IEnumerable<TARoot> entities) where TARoot : ABTAggregateRoot;

        Task<int> UpdateAsync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot;

        Task<int> UpdateAsync<TARoot>(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity) where TARoot : ABTAggregateRoot;

        Task<int> DeleteAsync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot;

        Task<int> DeleteAsync<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot;
        #endregion 异步
    }
}
