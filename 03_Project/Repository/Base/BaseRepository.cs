using IRepository.Base;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace Repository.Base
{
    public class BaseRepository<TEntity> : IBaseRepository<TEntity> where TEntity : class, new()
    {
        public Task<TEntity> Add(TEntity entity)
        {
            throw new NotImplementedException();
        }

        public Task<bool> Delete(dynamic id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> Delete(Expression<Func<TEntity, bool>> expression)
        {
            throw new NotImplementedException();
        }

        public Task<bool> Update(TEntity entity)
        {
            throw new NotImplementedException();
        }

        public async Task<IList<TEntity>> Query(Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, object>> orderExpression, bool isAsc = true)
        {
            throw new NotImplementedException();
        }

        public async Task<IList<TEntity>> Query(PagingVO paging, Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, object>> orderExpression, bool isAsc = true)
        {
            throw new NotImplementedException();
        }
    }
}
