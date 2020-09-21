using Entity;
using IRepository;
using Microsoft.EntityFrameworkCore;
using Repository.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Z.EntityFramework.Plus;

namespace Repository
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
            return _dbContext.SaveChanges();//数据回调，增加/修改可取数据使用
        }

        public TARoot Add<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            var result = _dbContext.Set<TARoot>().Add(entity);
            Save();
            _dbContext.Entry(entity).State = EntityState.Detached;
            return result.Entity;
        }

        public int BatchAdd<TARoot>(IEnumerable<TARoot> entities) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().AddRange(entities);
            return Save();
        }

        public int Update<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            var model = _dbContext.Entry(entity);
            model.State = EntityState.Modified;
            //_dbContext.Set<TARoot>().Attach(entity);

            //如果数据没有发生变化
            if (!_dbContext.ChangeTracker.HasChanges())
            {
                return 0;
            }
            var count = Save();
            model.State = EntityState.Detached;
            return count;
        }

        public int Update<TARoot>(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().Where(exp).Update(entity);
            //var model = new Entity() { id = 1, name = "XX" };
            //_dbContext.Set<TARoot>().Attach(model);
            //_dbContext.Entry(entity).Property(p => p.name).IsModified = true;
            return Save();
        }

        public int Delete<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().Remove(entity);//entity删除前数据库不存在会报错
            return Save();
        }

        private IQueryable<TARoot> Filter<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot
        {
            var dbSet = _dbContext.Set<TARoot>().AsNoTracking().AsQueryable();
            if (exp != null)
                dbSet = dbSet.Where(exp);
            return dbSet;
        }

        public int Delete<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().RemoveRange(Filter(exp));
            return Save();
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
