using System;

namespace IRepository.UnitOfWork
{
    /// <summary>
    /// 写操作
    /// </summary>
    public interface IUnitOfWork
    {
        IDbContext GetDbContext();

        void BeginTransaction();

        void CommitTransaction();

        void RollbackTransaction();
    }
}
