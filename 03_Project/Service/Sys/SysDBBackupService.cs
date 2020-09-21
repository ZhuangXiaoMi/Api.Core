using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysDBBackupService : BaseService<SysDBBackup>, ISysDBBackupService
    {
        private readonly ILogger<SysDBBackupService> _logger;

        public SysDBBackupService(IUnitOfWork unitOfWork, ISysDBBackupRepository sysDBBackupRepository, LoginInfo loginInfo, ILogger<SysDBBackupService> logger)
            : base(unitOfWork, sysDBBackupRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}