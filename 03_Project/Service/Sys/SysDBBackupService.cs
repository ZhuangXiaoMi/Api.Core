using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysDBBackupService : BaseService<SysDBBackup>, ISysDBBackupService
    {
        public SysDBBackupService(IUnitOfWork unitOfWork, ISysDBBackupRepository sysDBBackupRepository)
            : base(unitOfWork, sysDBBackupRepository)
        {

        }
    }
}