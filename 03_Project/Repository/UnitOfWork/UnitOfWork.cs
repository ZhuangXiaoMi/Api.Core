using IRepository;
using IRepository.UnitOfWork;
using System;

namespace Repository.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {
        private readonly IDbContext _dbContext;

        public UnitOfWork(IDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IDbContext GetDbContext()
        {
            return _dbContext;
        }

        public void BeginTransaction()
        {
            GetDbContext().Ado.BeginTran();
        }

        public void CommitTransaction()
        {
            try
            {
                GetDbContext().Ado.CommitTran();
            }
            catch (Exception ex)
            {
                GetDbContext().Ado.RollbackTran();
                throw ex;
            }
        }

        public void RollbackTransaction()
        {
            GetDbContext().Ado.RollbackTran();
        }

        public void Dispose()
        {
            _dbContext.Dispose();
        }
    }
}
