using IRepository.Base;
using IRepository.UnitOfWork;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace Repository.SqlSugar
{
    public class BaseRepository<TEntity> : IBaseRepository<TEntity> where TEntity : class, new()
    {
        private readonly ISqlSugarClient _dbContext;
        private readonly IUnitOfWork _unitOfWork;

        public BaseRepository(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _dbContext = unitOfWork.GetDbContext();
            //DbContext.Init(connectionString);
        }

        public async Task<TEntity> Add(TEntity entity)
        {
            return await _dbContext.Insertable(entity).ExecuteReturnEntityAsync();
        }

        public async Task<bool> Delete(dynamic id)
        {
            return await _dbContext.Deleteable<TEntity>().In(id).ExecuteCommandHasChangeAsync();
        }

        public async Task<bool> Delete(Expression<Func<TEntity, bool>> expression)
        {
            return await _dbContext.Deleteable<TEntity>().Where(expression).ExecuteCommandHasChangeAsync();
        }

        public async Task<bool> Update(TEntity entity)
        {
            return await _dbContext.Updateable(entity).ExecuteCommandHasChangeAsync();
        }

        public async Task<IList<TEntity>> Query(Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, object>> orderExpression, bool isAsc = true)
        {
            return await _dbContext.Queryable<TEntity>()
                .OrderByIF(orderExpression != null, orderExpression, isAsc ? OrderByType.Asc : OrderByType.Desc)
                .WhereIF(whereExpression != null, whereExpression).ToListAsync();
        }

        public async Task<IList<TEntity>> Query(PagingVO paging, Expression<Func<TEntity, bool>> whereExpression, Expression<Func<TEntity, object>> orderExpression, bool isAsc = true)
        {
            return await _dbContext.Queryable<TEntity>()
                .OrderByIF(orderExpression != null, orderExpression, isAsc ? OrderByType.Asc : OrderByType.Desc)
                .WhereIF(whereExpression != null, whereExpression)
                .ToPageListAsync(paging.CurrentPage, paging.PageSize, paging.TotalRecord);
        }
    }
}
