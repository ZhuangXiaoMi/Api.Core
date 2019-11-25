using IRepository.UnitOfWork;
using SqlSugar;
using System;

namespace Repository.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {
        private readonly ISqlSugarClient _dbContext;

        public UnitOfWork(ISqlSugarClient dbContext)
        {
            _dbContext = dbContext;
        }

        public ISqlSugarClient GetDbContext()
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
