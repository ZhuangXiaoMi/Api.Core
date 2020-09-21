using DTO;
using Entity;
using IRepository;
using IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace Service
{
    public class BaseService<TARoot> : IBaseService<TARoot> where TARoot : ABTAggregateRoot
    {
        protected readonly IUnitOfWork _unitOfWork;
        protected readonly IBaseRepository<TARoot> _baseRepository;
        protected readonly LoginInfo _loginInfo;

        public BaseService(IUnitOfWork unitOfWork, IBaseRepository<TARoot> baseRepository, LoginInfo loginInfo)
        {
            _unitOfWork = unitOfWork;
            _baseRepository = baseRepository;
            _loginInfo = loginInfo;
        }

        public bool IsExist(Expression<Func<TARoot, bool>> exp)
            => _baseRepository.IsExist(exp);

        public int GetCount(Expression<Func<TARoot, bool>> exp = null)
            => _baseRepository.GetCount(exp);

        public TARoot FindSingle(Expression<Func<TARoot, bool>> exp = null)
            => _baseRepository.FindSingle(exp);

        public IQueryable<TARoot> Find(Expression<Func<TARoot, bool>> exp = null)
            => _baseRepository.Find(exp);

        public IQueryable<TARoot> FindPage(out int total, int pageIndex = 1, int pageSize = 20
            , Expression<Func<TARoot, bool>> exp = null, OrderByDto[] orderParams = null)
            => _baseRepository.FindPage(out total, pageIndex, pageSize, exp, orderParams);

        public IQueryable<TARoot> FromSql(string sql, params object[] parames)
            => _baseRepository.FromSql(sql, parames);

        public void BeginTransaction()
            => _unitOfWork.BeginTransaction();

        public void CommitTransaction()
            => _unitOfWork.CommitTransaction();

        public void RollbackTransaction()
            => _unitOfWork.RollbackTransaction();

        public int Save()
            => _unitOfWork.Save();

        public TARoot Add(TARoot entity)
            => _unitOfWork.Add(entity);

        public int BatchAdd(IEnumerable<TARoot> entities)
            => _unitOfWork.BatchAdd(entities);

        public int Update(TARoot entity)
            => _unitOfWork.Update(entity);

        public int Update(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity)
            => _unitOfWork.Update(exp, entity);

        public int Delete(TARoot entity)
            => _unitOfWork.Delete(entity);

        public int Delete(Expression<Func<TARoot, bool>> exp)
            => _unitOfWork.Delete(exp);

        public int ExecuteSql(string sql, IEnumerable<TARoot> parames = null)
            => _unitOfWork.ExecuteSql(sql, parames);
    }
}
