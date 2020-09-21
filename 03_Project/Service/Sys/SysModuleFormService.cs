using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysModuleFormService : BaseService<SysModuleForm>, ISysModuleFormService
    {
        private readonly ILogger<SysModuleFormService> _logger;

        public SysModuleFormService(IUnitOfWork unitOfWork, ISysModuleFormRepository sysModuleFormRepository, LoginInfo loginInfo, ILogger<SysModuleFormService> logger)
            : base(unitOfWork, sysModuleFormRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}