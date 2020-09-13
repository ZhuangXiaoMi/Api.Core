using Entity;
using IRepository;
using IRepository.UnitOfWork;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Linq.Expressions;
using System.Threading.Tasks;

//using SqlSugar;

namespace Repository.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {
        private readonly IDbContext _dbContext;
        private IDbContextTransaction _dbContextTransaction;

        public UnitOfWork(IDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IDbContext GetDbContext()
        {
            return _dbContext;
        }

        public async Task<bool> Add<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : ABTAggregateRoot
        {
            _dbContext.Set<TAggregateRoot>().Add(entity);
            if (_dbContextTransaction != null)
                return await _dbContext.SaveChangesEntityAsync() > 0;
            return true;
        }

        public async Task<bool> Delete<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : ABTAggregateRoot
        {
            _dbContext.Set<TAggregateRoot>().Remove(entity);
            if (_dbContextTransaction != null)
                return await _dbContext.SaveChangesEntityAsync() > 0;
            return true;
        }

        public async Task<bool> Update<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : ABTAggregateRoot
        {
            _dbContext.Entry<TAggregateRoot>(entity).State = EntityState.Modified;
            if (_dbContextTransaction != null)
                return await _dbContext.SaveChangesEntityAsync() > 0;
            return true;
        }

        public void BeginTransaction()
        {
            _dbContextTransaction = _dbContext.Database.BeginTransaction();
        }

        public async Task<bool> CommitTransaction()
        {
            if (_dbContextTransaction == null)
                return await _dbContext.SaveChangesEntityAsync() > 0;
            else
                _dbContextTransaction.Commit();
            return true;
        }

        public void RollbackTransaction()
        {
            if (_dbContextTransaction != null)
            {
                _dbContextTransaction.Rollback();
            }
        }

        public void Dispose()
        {
            if (_dbContextTransaction != null)
            {
                _dbContextTransaction.Dispose();
            }
        }
    }
}
