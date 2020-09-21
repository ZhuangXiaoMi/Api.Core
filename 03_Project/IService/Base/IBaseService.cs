using DTO;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace IService
{
    public interface IBaseService<TARoot> where TARoot : ABTAggregateRoot
    {
        bool IsExist(Expression<Func<TARoot, bool>> exp);

        int GetCount(Expression<Func<TARoot, bool>> exp = null);

        TARoot FindSingle(Expression<Func<TARoot, bool>> exp = null);

        IQueryable<TARoot> Find(Expression<Func<TARoot, bool>> exp = null);

        IQueryable<TARoot> FindPage(out int total, int pageIndex = 1, int pageSize = 20
            , Expression<Func<TARoot, bool>> exp = null, OrderByDto[] orderParams = null);

        IQueryable<TARoot> FromSql(string sql, params object[] parames);

        void BeginTransaction();

        void CommitTransaction();

        void RollbackTransaction();

        int Save();

        TARoot Add(TARoot entity);

        int BatchAdd(IEnumerable<TARoot> entities);

        int Update(TARoot entity);

        /// <summary>
        /// 更新部分字段，如：Update(p => p.id = 1, p => new Entity { property = value });
        /// </summary>
        /// <typeparam name="TARoot"></typeparam>
        /// <param name="exp"></param>
        /// <param name="entity"></param>
        int Update(Expression<Func<TARoot, bool>> exp, Expression<Func<TARoot, TARoot>> entity);

        int Delete(TARoot entity);

        int Delete(Expression<Func<TARoot, bool>> exp);

        int ExecuteSql(string sql, IEnumerable<TARoot> parames = null);
    }
}
