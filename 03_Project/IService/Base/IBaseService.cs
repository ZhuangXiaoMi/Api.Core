using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace IService.Base
{
    public interface IBaseService<TEntity> where TEntity : class, new()
    {
        Task<TEntity> Add(TEntity entity);

        Task<bool> Delete(dynamic id);

        Task<bool> Delete(Expression<Func<TEntity, bool>> expression);

        Task<bool> Update(TEntity entity);

        //Task<IQueryable<TEntity>> Query<SEntity>(Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, SEntity>> orderExpression, bool isAsc = true);
        Task<IList<TEntity>> Query(Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, object>> orderExpression, bool isAsc = true);

        //Task<IQueryable<TEntity>> Query<SEntity>(PagingVO paging, Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, SEntity>> orderExpression, bool isAsc = true);
        Task<IList<TEntity>> Query(PagingVO paging, Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, object>> orderExpression, bool isAsc = true);
    }
}
