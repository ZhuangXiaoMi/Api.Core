using Entity;
using IRepository;
using IRepository.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using VO.SysManage;

namespace Repository.EF
{
    public abstract class BaseRepository<TAggregateRoot> : IBaseRepository<TAggregateRoot> where TAggregateRoot : ABTAggregateRoot
    {
        private readonly IDbContext _dbContext;
        public readonly IQueryable<TAggregateRoot> _entity;

        public BaseRepository(IDbContext dbContext)
        {
            _dbContext = dbContext;
            _entity = _dbContext.Set<TAggregateRoot>();
        }

        //public async Task<IList<TAggregateRoot>> Query(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true)
        //{
        //    throw new NotImplementedException();
        //}

        //public async Task<IList<TAggregateRoot>> Query(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true)
        //{
        //    throw new NotImplementedException();
        //}

        public IQueryable<TAggregateRoot> Query<SEntity>(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true)
        {
            if (isAsc)
            {
                return _entity.Where(whereExpression).OrderBy(orderExpression);
            }
            else
            {
                return _entity.Where(whereExpression).OrderByDescending(orderExpression);
            }
        }

        public IQueryable<TAggregateRoot> Query<SEntity>(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true)
        {
            IQueryable<TAggregateRoot> list;
            if (isAsc)
            {
                list = _entity.Where(whereExpression).OrderBy(orderExpression);
            }
            else
            {
                list = _entity.Where(whereExpression).OrderByDescending(orderExpression);
            }
            paging.TotalRecord = list.Count();
            list = list.Skip<TAggregateRoot>((paging.CurrentPage - 1) * paging.PageSize).Take<TAggregateRoot>(paging.PageSize);
            return list;
        }
    }
}
