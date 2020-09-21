using Entity;
using System;
using System.Collections.Generic;
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

        void CommitTransaction();

        void RollbackTransaction();
        #endregion 事务

        #region 同步
        int Save();

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

        int ExecuteSql<TARoot>(string sql, IEnumerable<TARoot> parames = null) where TARoot : ABTAggregateRoot;
        #endregion 同步

        #region 异步
        Task<TARoot> AddSync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot;

        Task<int> BatchAddSync<TARoot>(IEnumerable<TARoot> entities) where TARoot : ABTAggregateRoot;

        Task<int> UpdateSync<TARoot>(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity) where TARoot : ABTAggregateRoot;

        Task<int> DeleteSync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot;

        Task<int> DeleteSync<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot;
        #endregion 异步
    }
}
