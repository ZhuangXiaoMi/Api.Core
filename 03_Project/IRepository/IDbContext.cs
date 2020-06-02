using Entity.BaseManage;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IRepository
{
    public interface IDbContext
    {
        #region EntityFrameworkCore
        DatabaseFacade Database { get; }

        EntityEntry<TEntity> Entry<TEntity>(TEntity entity) where TEntity : class;

        DbSet<TEntity> Set<TEntity>() where TEntity : class;
        #endregion EntityFrameworkCore

        Task<int> SaveChangesEntityAsync();

        Task<TAggregateRoot> AddEntityAsync<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : class, IAggregateRoot;

        Task<bool> DeleteEntityAsync<TAggregateRoot>(dynamic id) where TAggregateRoot : class, IAggregateRoot;

        Task<bool> DeleteEntityAsync<TAggregateRoot>(Expression<Func<TAggregateRoot, bool>> expression) where TAggregateRoot : class, IAggregateRoot;

        Task<TAggregateRoot> UpdateEntityAsync<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : class, IAggregateRoot;
    }
}
