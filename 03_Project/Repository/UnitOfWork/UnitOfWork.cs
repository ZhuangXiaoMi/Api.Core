using Entity;
using IRepository.UnitOfWork;
using Microsoft.EntityFrameworkCore;
using Repository.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Z.EntityFramework.Plus;

namespace Repository.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApiDbContext _dbContext;

        public UnitOfWork(ApiDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        #region 事务
        public void BeginTransaction()
        {
            _dbContext.Database.BeginTransaction();
        }

        public void CommitTransaction()
        {
            _dbContext.Database.CommitTransaction();
        }

        public void RollbackTransaction()
        {
            _dbContext.Database.RollbackTransaction();
        }
        #endregion 事务

        #region 同步
        public int Save()
        {
            return _dbContext.SaveChanges();
        }

        public TARoot Add<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            var result = _dbContext.Set<TARoot>().Add(entity);
            Save();
            _dbContext.Entry(entity).State = EntityState.Detached;
            return result.Entity;
        }

        public void BatchAdd<TARoot>(IEnumerable<TARoot> entities) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().AddRange(entities);
            Save();
        }

        public void Update<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            var model = _dbContext.Entry(entity);
            model.State = EntityState.Modified;

            //如果数据没有发生变化
            if (!_dbContext.ChangeTracker.HasChanges())
            {
                return;
            }
            Save();
            model.State = EntityState.Detached;
        }

        public void Update<TARoot>(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().Where(exp).Update(entity);
            Save();
        }

        public void Delete<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().Remove(entity);
            Save();
        }

        private IQueryable<TARoot> Filter<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot
        {
            var dbSet = _dbContext.Set<TARoot>().AsNoTracking().AsQueryable();
            if (exp != null)
                dbSet = dbSet.Where(exp);
            return dbSet;
        }

        public void Delete<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().RemoveRange(Filter(exp));
            Save();
        }

        public int ExecuteSql<TARoot>(string sql, IEnumerable<TARoot> parames = null) where TARoot : ABTAggregateRoot
        {
            if (parames == null)
            {
                return _dbContext.Database.ExecuteSqlRaw(sql);
            }
            return _dbContext.Database.ExecuteSqlRaw(sql, parames);
        }
        #endregion 同步

        #region 异步
        public async Task<TARoot> AddSync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            var result = await _dbContext.Set<TARoot>().AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return result.Entity;
        }

        public async Task<int> BatchAddSync<TARoot>(IEnumerable<TARoot> entities) where TARoot : ABTAggregateRoot
        {
            await _dbContext.Set<TARoot>().AddRangeAsync(entities);
            return await _dbContext.SaveChangesAsync();
        }

        public async Task<int> UpdateSync<TARoot>(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity) where TARoot : ABTAggregateRoot
        {
            await _dbContext.Set<TARoot>().Where(exp).UpdateAsync(entity);
            return await _dbContext.SaveChangesAsync();
        }

        public async Task<int> DeleteSync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().Remove(entity);
            return await _dbContext.SaveChangesAsync();
        }

        public async Task<int> DeleteSync<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().RemoveRange(Filter(exp));
            return await _dbContext.SaveChangesAsync();
        }
        #endregion 异步
    }
}
