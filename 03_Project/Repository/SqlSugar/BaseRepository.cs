using Entity;
using IRepository;
using IRepository.Base;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace Repository.SqlSugar
{
    public abstract class BaseRepository<TAggregateRoot> /*: IBaseRepository<TAggregateRoot>*/ where TAggregateRoot : ABTAggregateRoot
    {
        private readonly IDbContext _dbContext;
        public readonly IQueryable<TAggregateRoot> _entity;

        public BaseRepository(IDbContext dbContext)
        {
            _dbContext = dbContext;
            //DbContext.Init(connectionString);
            //_entity = _dbContext.Set<TAggregateRoot>();
        }

        //public async Task<IList<TAggregateRoot>> Query(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true)
        //{
        //    return await _dbContext.Queryable<TAggregateRoot>()
        //        .OrderByIF(orderExpression != null, orderExpression, isAsc ? OrderByType.Asc : OrderByType.Desc)
        //        .WhereIF(whereExpression != null, whereExpression).ToListAsync();
        //}

        //public async Task<IList<TAggregateRoot>> Query(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true)
        //{
        //    return await _dbContext.Queryable<TAggregateRoot>()
        //        .OrderByIF(orderExpression != null, orderExpression, isAsc ? OrderByType.Asc : OrderByType.Desc)
        //        .WhereIF(whereExpression != null, whereExpression)
        //        .ToPageListAsync(paging.CurrentPage, paging.PageSize, paging.TotalRecord);
        //}

        //public IQueryable<TAggregateRoot> Query<SEntity>(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true)
        //{
        //    throw new NotImplementedException();
        //}

        //public IQueryable<TAggregateRoot> Query<SEntity>(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true)
        //{
        //    throw new NotImplementedException();
        //}
    }
}
