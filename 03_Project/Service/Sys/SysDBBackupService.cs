using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysDBBackupService : BaseService<SysDBBackup>, ISysDBBackupService
    {
        public SysDBBackupService(IUnitOfWork unitOfWork, ISysDBBackupRepository sysDBBackupRepository)
            : base(unitOfWork, sysDBBackupRepository)
        {

        }
    }
}