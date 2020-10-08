using DTO;
using Entity;
using IRepository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;

namespace Repository.EF
{
    public class BaseRepository<TARoot> : IBaseRepository<TARoot> where TARoot : ABTAggregateRoot
    {
        private readonly ApiDbContext _dbContext;
        public readonly IQueryable<TARoot> _dbSet;

        public BaseRepository(ApiDbContext dbContext)
        {
            _dbContext = dbContext;
            _dbSet = _dbContext.Set<TARoot>();
        }

        #region 同步
        public bool IsExist(Expression<Func<TARoot, bool>> exp)
        {
            return _dbContext.Set<TARoot>().Any(exp);
        }

        private IQueryable<TARoot> Filter(Expression<Func<TARoot, bool>> exp = null)
        {
            var dbSet = _dbContext.Set<TARoot>().AsNoTracking().AsQueryable();
            if (exp != null)
                dbSet = dbSet.Where(exp);
            return dbSet;
        }

        public int GetCount(Expression<Func<TARoot, bool>> exp = null)
        {
            return Filter(exp).Count();
        }

        public TARoot FindSingle(Expression<Func<TARoot, bool>> exp = null)
        {
            return _dbContext.Set<TARoot>().AsNoTracking().FirstOrDefault(exp);
        }

        public IQueryable<TARoot> Find(Expression<Func<TARoot, bool>> exp = null)
        {
            return Filter(exp);
        }

        public IQueryable<TARoot> FindPage(out int total, int pageIndex = 1, int pageSize = 20
            , Expression<Func<TARoot, bool>> exp = null, OrderByDto[] orderParams = null)
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

        #endregion 异步
    }
}
