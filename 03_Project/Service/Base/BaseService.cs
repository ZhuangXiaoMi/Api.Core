using IRepository.Base;
using IService.Base;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace Service.Base
{
    public class BaseService<TEntity> : IBaseService<TEntity> where TEntity : class, new()
    {
        public IBaseRepository<TEntity> _baseRepository;

        public async Task<TEntity> Add(TEntity entity)
        {
            return await _baseRepository.Add(entity);
        }

        public async Task<bool> Delete(dynamic id)
        {
            return await _baseRepository.Delete(id);
        }

        public async Task<bool> Delete(Expression<Func<TEntity, bool>> expression)
        {
            return await _baseRepository.Delete(expression);
        }

        public async Task<bool> Update(TEntity entity)
        {
            return await _baseRepository.Update(entity);
        }

        public async Task<IList<TEntity>> Query(Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, object>> orderExpression, bool isAsc = true)
        {
            return await _baseRepository.Query(whereExpression, orderExpression, isAsc);
        }

        public async Task<IList<TEntity>> Query(PagingVO paging, Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, object>> orderExpression, bool isAsc = true)
        {
            return await _baseRepository.Query(paging, whereExpression, orderExpression, isAsc);
        }
    }
}
