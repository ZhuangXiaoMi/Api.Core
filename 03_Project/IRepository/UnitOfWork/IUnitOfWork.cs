using Entity;
using System;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IRepository.UnitOfWork
{
    /// <summary>
    /// 写操作
    /// </summary>
    public interface IUnitOfWork
    {
        IDbContext GetDbContext();

        Task<bool> Add<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : ABTAggregateRoot;

        Task<bool> Delete<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : ABTAggregateRoot;

        //Task<bool> Delete<TAggregateRoot>(Expression<Func<TAggregateRoot, bool>> expression) where TAggregateRoot : ABTAggregateRoot;

        Task<bool> Update<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : ABTAggregateRoot;

        void BeginTransaction();

        Task<bool> CommitTransaction();

        void RollbackTransaction();
    }
}
