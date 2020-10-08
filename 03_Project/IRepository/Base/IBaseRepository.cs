using DTO;
using Entity;
using System;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;

namespace IRepository
{
    /// <summary>
    /// 读操作
    /// </summary>
    /// <typeparam name="TARoot"></typeparam>
    public interface IBaseRepository<TARoot> where TARoot : ABTAggregateRoot
    {
        #region 同步
        bool IsExist(Expression<Func<TARoot, bool>> exp);

        int GetCount(Expression<Func<TARoot, bool>> exp = null);

        TARoot FindSingle(Expression<Func<TARoot, bool>> exp = null);

        IQueryable<TARoot> Find(Expression<Func<TARoot, bool>> exp = null);

        IQueryable<TARoot> FindPage(out int total, int pageIndex = 1, int pageSize = 20
            , Expression<Func<TARoot, bool>> exp = null, OrderByDto[] orderParams = null);

        IQueryable<T> FromSql<T>(string sql, params DbParameter[] parames) where T : class;
        #endregion 同步

        #region 异步

        #endregion 异步
    }
}
