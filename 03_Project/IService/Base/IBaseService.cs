using Entity.BaseManage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace IService.Base
{
    public interface IBaseService<TAggregateRoot> where TAggregateRoot : class, IAggregateRoot
    {
        Task<bool> Add(TAggregateRoot entity);

        Task<bool> Delete(TAggregateRoot entity);

        //Task<bool> Delete(Expression<Func<TAggregateRoot, bool>> expression);

        Task<bool> Update(TAggregateRoot entity);

        IQueryable<TAggregateRoot> Query<SEntity>(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true);
        //Task<IList<TAggregateRoot>> Query(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true);

        IQueryable<TAggregateRoot> Query<SEntity>(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true);
        //Task<IList<TAggregateRoot>> Query(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true);
    }
}
