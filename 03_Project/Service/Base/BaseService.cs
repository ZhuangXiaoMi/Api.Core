using Entity;
using IRepository.Base;
using IRepository.UnitOfWork;
using IService.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VO.SysManage;

namespace Service.Base
{
    public class BaseService<TAggregateRoot> : IBaseService<TAggregateRoot> where TAggregateRoot : ABTAggregateRoot
    {
        protected readonly IUnitOfWork _unitOfWork;
        protected readonly IBaseRepository<TAggregateRoot> _baseRepository;

        public BaseService(IUnitOfWork unitOfWork, IBaseRepository<TAggregateRoot> baseRepository)
        {
            _unitOfWork = unitOfWork;
            _baseRepository = baseRepository;
        }

        public async Task<bool> Add(TAggregateRoot entity)
        {
            return await _unitOfWork.Add<TAggregateRoot>(entity);
        }

        public async Task<bool> Delete(TAggregateRoot entity)
        {
            return await _unitOfWork.Delete<TAggregateRoot>(entity);
        }

        public async Task<bool> Update(TAggregateRoot entity)
        {
            return await _unitOfWork.Update<TAggregateRoot>(entity);
        }

        public IQueryable<TAggregateRoot> Query<SEntity>(Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true)
        {
            return _baseRepository.Query<SEntity>(whereExpression, orderExpression, isAsc);
        }

        public IQueryable<TAggregateRoot> Query<SEntity>(PagingVO paging, Expression<Func<TAggregateRoot, bool>> whereExpression, Expression<Func<TAggregateRoot, SEntity>> orderExpression, bool isAsc = true)
        {
            return _baseRepository.Query<SEntity>(paging, whereExpression, orderExpression, isAsc);
        }
    }
}
