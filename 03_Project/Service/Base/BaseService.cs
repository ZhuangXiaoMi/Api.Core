using DTO;
using Entity;
using IRepository;
using IService;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

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

        #region 读操作
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

        public IQueryable<T> FromSql<T>(string sql, params DbParameter[] parames) where T : class
            => _baseRepository.FromSql<T>(sql, parames);
        #endregion 读操作

        #region 写操作
        #region 事务
        public void BeginTransaction()
            => _unitOfWork.BeginTransaction();
        public async Task BeginTransactionAsync()
            => await _unitOfWork.BeginTransactionAsync();

        public void CommitTransaction()
            => _unitOfWork.CommitTransaction();
        public async Task CommitTransactionAsync()
            => await _unitOfWork.CommitTransactionAsync();

        public void RollbackTransaction()
            => _unitOfWork.RollbackTransaction();
        public async Task RollbackTransactionAsync()
            => await _unitOfWork.RollbackTransactionAsync();
        #endregion 事务

        #region 执行 SQL 语句
        public int ExecuteSql(string sql, params DbParameter[] parames)
            => _unitOfWork.ExecuteSql(sql, parames);
        public async Task<int> ExecuteSqlAsync(string sql, params DbParameter[] parames)
            => await _unitOfWork.ExecuteSqlAsync(sql, parames);

        public int ExecuteProc(string procName, params DbParameter[] parames)
            => _unitOfWork.ExecuteProc(procName, parames);
        public async Task<int> ExecuteProcAsync(string procName, params DbParameter[] parames)
            => await _unitOfWork.ExecuteProcAsync(procName, parames);
        #endregion 执行 SQL 语句

        #region 增删改
        public TARoot Add(TARoot entity)
            => _unitOfWork.Add(entity);
        public async Task<TARoot> AddAsync(TARoot entity)
            => await _unitOfWork.AddAsync(entity);

        public int BatchAdd(IEnumerable<TARoot> entities)
            => _unitOfWork.BatchAdd(entities);
        public async Task<int> BatchAddAsync(IEnumerable<TARoot> entities)
            => await _unitOfWork.BatchAddAsync(entities);

        public int Update(TARoot entity)
            => _unitOfWork.Update(entity);
        public async Task<int> UpdateAsync(TARoot entity)
            => await _unitOfWork.UpdateAsync(entity);

        public int Update(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity)
            => _unitOfWork.Update(exp, entity);
        public async Task<int> UpdateAsync(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity)
            => await _unitOfWork.UpdateAsync(exp, entity);

        public int Delete(TARoot entity)
            => _unitOfWork.Delete(entity);
        public async Task<int> DeleteAsync(TARoot entity)
            => await _unitOfWork.DeleteAsync(entity);

        public int Delete(Expression<Func<TARoot, bool>> exp)
            => _unitOfWork.Delete(exp);
        public async Task<int> DeleteAsync(Expression<Func<TARoot, bool>> exp)
            => await _unitOfWork.DeleteAsync(exp);
        #endregion 增删改
        #endregion 写操作
    }
}
