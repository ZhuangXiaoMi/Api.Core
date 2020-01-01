using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysDBBackupRepository
    /// </summary>
    public class SysDBBackupRepository : BaseRepository<SysDBBackup>, ISysDBBackupRepository
    {
        public SysDBBackupRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}