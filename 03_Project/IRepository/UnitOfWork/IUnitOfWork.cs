using SqlSugar;

namespace IRepository.UnitOfWork
{
    public interface IUnitOfWork
    {
        ISqlSugarClient GetDbContext();

        void BeginTransaction();

        void CommitTransaction();

        void RollbackTransaction();
    }
}
