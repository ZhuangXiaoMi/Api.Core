using Common;
using DTO;
using Entity;
using IRepository;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using Repository.EF;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Z.EntityFramework.Plus;

namespace Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApiDbContext _dbContext;
        private IDbContextTransaction _dbContextTransaction;

        public UnitOfWork(ApiDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        #region 事务
        public void BeginTransaction()
        {
            DbConnection dbConnection = _dbContext.Database.GetDbConnection();
            if (dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }
            _dbContextTransaction = _dbContext.Database.BeginTransaction();
        }
        public async Task BeginTransactionAsync()
        {
            DbConnection dbConnection = _dbContext.Database.GetDbConnection();
            if (dbConnection.State == ConnectionState.Closed)
            {
                await dbConnection.OpenAsync();
            }
            _dbContextTransaction = await _dbContext.Database.BeginTransactionAsync();
        }

        public void CommitTransaction()
        {
            //_dbContext.Database.CommitTransaction();
            if (_dbContextTransaction != null)
            {
                _dbContextTransaction.Commit();
            }
        }
        public async Task CommitTransactionAsync()
        {
            if (_dbContextTransaction != null)
            {
                await _dbContextTransaction.CommitAsync();
            }
        }

        public void RollbackTransaction()
        {
            //_dbContext.Database.RollbackTransaction();
            _dbContextTransaction.Rollback();
            _dbContextTransaction.Dispose();
            _dbContext.Dispose();
        }
        public async Task RollbackTransactionAsync()
        {
            await _dbContextTransaction.RollbackAsync();
            await _dbContextTransaction.DisposeAsync();
            await _dbContext.DisposeAsync();
        }
        #endregion 事务

        #region 执行 SQL 语句
        public int ExecuteSql(string sql, params DbParameter[] parames)
        {
            if (parames.Length > 0)
            {
                return _dbContext.Database.ExecuteSqlRaw(sql);
            }
            return _dbContext.Database.ExecuteSqlRaw(sql, parames);
        }
        public async Task<int> ExecuteSqlAsync(string sql, params DbParameter[] parames)
        {
            if (parames.Length > 0)
            {
                return await _dbContext.Database.ExecuteSqlRawAsync(sql);
            }
            return await _dbContext.Database.ExecuteSqlRawAsync(sql, parames);
        }

        public int ExecuteProc(string procName, params DbParameter[] parames)
        {
            if (parames.Length > 0)
            {
                return _dbContext.Database.ExecuteSqlRaw(ADOExt.BuilderProc(procName));
            }
            return _dbContext.Database.ExecuteSqlRaw(ADOExt.BuilderProc(procName, parames), parames);
        }
        public async Task<int> ExecuteProcAsync(string procName, params DbParameter[] parames)
        {
            if (parames.Length > 0)
            {
                return await _dbContext.Database.ExecuteSqlRawAsync(ADOExt.BuilderProc(procName));
            }
            return await _dbContext.Database.ExecuteSqlRawAsync(ADOExt.BuilderProc(procName, parames), parames);
        }
        #endregion 执行 SQL 语句

        #region 同步
        private int Save()
        {
            ADOExt.SetEntityDefaultValue(_dbContext);
            return _dbContext.SaveChanges();//数据回调，增加/修改可取数据使用
        }

        private IQueryable<TARoot> Filter<TARoot>(Expression<Func<TARoot, bool>> exp = null) where TARoot : ABTAggregateRoot
        {
            var dbSet = _dbContext.Set<TARoot>().AsNoTracking().AsQueryable();
            if (exp != null)
                dbSet = dbSet.Where(exp);
            return dbSet;
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
            #region 更新部分字段
            //var model = new Entity() { id = 1, name = "XX" };
            //_dbContext.Set<TARoot>().Attach(model);
            //_dbContext.Entry(entity).Property(p => p.name).IsModified = true;

            //_dbContext.Set<TARoot>().Attach(entity);
            //Hashtable props = ADOExt.GetPropertyInfo<TARoot>(entity);
            //foreach (string item in props.Keys)
            //{
            //    object value = _dbContext.Entry(entity).Property(item).CurrentValue;
            //    if (value != null)
            //    {
            //        _dbContext.Entry(entity).Property(item).IsModified = true;
            //    }
            //} 
            #endregion 更新部分字段
            return Save();
        }

        public int Delete<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().Remove(entity);//entity删除前数据库不存在会报错
            return Save();
        }

        public int Delete<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot
        {
            IEnumerable<TARoot> entities = Filter(exp);
            if (entities.Count() > 0)
            {
                _dbContext.Set<TARoot>().RemoveRange(entities);
                return Save();
            }
            else
            {
                return 0;
            }
        }


        public bool IsExist<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot
        {
            return _dbContext.Set<TARoot>().Any(exp);
        }

        public int GetCount<TARoot>(Expression<Func<TARoot, bool>> exp = null) where TARoot : ABTAggregateRoot
        {
            return Filter(exp).Count();
        }

        public TARoot FindSingle<TARoot>(Expression<Func<TARoot, bool>> exp = null) where TARoot : ABTAggregateRoot
        {
            return _dbContext.Set<TARoot>().AsNoTracking().FirstOrDefault(exp);
        }

        public IQueryable<TARoot> Find<TARoot>(Expression<Func<TARoot, bool>> exp = null) where TARoot : ABTAggregateRoot
        {
            return Filter(exp);
        }

        public IQueryable<TARoot> FindPage<TARoot>(out int total, int pageIndex = 1, int pageSize = 20
            , Expression<Func<TARoot, bool>> exp = null, OrderByDto[] orderParams = null) where TARoot : ABTAggregateRoot
        {
            var list = Filter(exp);
            if (orderParams != null && orderParams.Length > 0)
            {
                var queryExp = list.Expression;
                var parameter = Expression.Parameter(typeof(TARoot), "p");
                //var parameter = Expression.Parameter(list.ElementType);
                var methodAsc = "OrderBy";
                var methodDesc = "OrderByDescending";
                foreach (var param in orderParams)
                {
                    //根据属性名获取属性
                    var property = typeof(TARoot).GetProperty(param.property_name);
                    //var property = Expression.Property(parameter, param.property_name);
                    if (property == null) continue;

                    //创建一个访问属性的表达式
                    var propertyAccess = Expression.MakeMemberAccess(parameter, property);
                    var orderByExp = Expression.Lambda(propertyAccess, parameter);
                    var methodName = param.method == OrderByEnum.ASC ? methodAsc : methodDesc;
                    queryExp = Expression.Call(typeof(Queryable), methodName
                        , new Type[] { typeof(TARoot), property.PropertyType }
                        , queryExp, Expression.Quote(orderByExp));

                    methodAsc = "ThenBy";
                    methodDesc = "ThenByDescending";
                }
                list = list.Provider.CreateQuery<TARoot>(queryExp);
            }

            total = list.Count();
            return list.Skip((pageIndex - 1) * pageSize).Take(pageSize);
        }

        public IQueryable<T> FromSql<T>(string sql, params DbParameter[] parames) where T : class
        {
            return _dbContext.Set<T>().FromSqlRaw(sql, parames);
        }
        #endregion 同步

        #region 异步
        private async Task<int> SaveAsync()
        {
            ADOExt.SetEntityDefaultValue(_dbContext);
            return await _dbContext.SaveChangesAsync();//数据回调，增加/修改可取数据使用
        }

        public async Task<TARoot> AddAsync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            var result = await _dbContext.Set<TARoot>().AddAsync(entity);
            await SaveAsync();
            return result.Entity;
        }

        public async Task<int> BatchAddAsync<TARoot>(IEnumerable<TARoot> entities) where TARoot : ABTAggregateRoot
        {
            await _dbContext.Set<TARoot>().AddRangeAsync(entities);
            return await SaveAsync();
        }

        public async Task<int> UpdateAsync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            await _dbContext.Set<TARoot>().SingleUpdateAsync(entity);
            return await SaveAsync();
        }

        public async Task<int> UpdateAsync<TARoot>(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity) where TARoot : ABTAggregateRoot
        {
            await _dbContext.Set<TARoot>().Where(exp).UpdateAsync(entity);
            return await SaveAsync();
        }

        public async Task<int> DeleteAsync<TARoot>(TARoot entity) where TARoot : ABTAggregateRoot
        {
            _dbContext.Set<TARoot>().Remove(entity);
            return await SaveAsync();
        }

        public async Task<int> DeleteAsync<TARoot>(Expression<Func<TARoot, bool>> exp) where TARoot : ABTAggregateRoot
        {
            IEnumerable<TARoot> entities = Filter(exp);
            if (entities.Count() > 0)
            {
                _dbContext.Set<TARoot>().RemoveRange(entities);
                return await SaveAsync();
            }
            else
            {
                return 0;
            }
        }
        #endregion 异步
    }
}
