using Entity.BaseManage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace IRepository.Base
{
    /// <summary>
    /// 读操作
    /// </summary>
    /// <typeparam name="TAggregateRoot"></typeparam>
    public interface IBaseRepository<TAggregateRoot> where TAggregateRoot : class, IAggregateRoot
    {
        IQueryable<TAggregateRoot> Query<SEntity>(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true);
        //Task<IList<TAggregateRoot>> Query(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true);

        IQueryable<TAggregateRoot> Query<SEntity>(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true);
        //Task<IList<TAggregateRoot>> Query(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, object>> orderExpression, bool isAsc = true);
    }
}
