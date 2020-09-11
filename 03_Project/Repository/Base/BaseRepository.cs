using Entity;
using IRepository.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace Repository.Base
{
    public class BaseRepository<TAggregateRoot> /*: IBaseRepository<TAggregateRoot>*/ where TAggregateRoot : ABTAggregateRoot
    {
        public async Task<IList<TAggregateRoot>> Query(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true)
        {
            throw new NotImplementedException();
        }

        public async Task<IList<TAggregateRoot>> Query(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true)
        {
            throw new NotImplementedException();
        }

        public async Task<IQueryable<TAggregateRoot>> Query<SEntity>(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true)
        {
            throw new NotImplementedException();
        }

        public async Task<IQueryable<TAggregateRoot>> Query<SEntity>(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true)
        {
            throw new NotImplementedException();
        }
    }
}
