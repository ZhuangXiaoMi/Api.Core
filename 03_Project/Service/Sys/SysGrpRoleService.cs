using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysGrpRoleService : BaseService<SysGrpRole>, ISysGrpRoleService
    {
        private readonly ILogger<SysGrpRoleService> _logger;

        public SysGrpRoleService(IUnitOfWork unitOfWork, ISysGrpRoleRepository sysGrpRoleRepository, LoginInfo loginInfo, ILogger<SysGrpRoleService> logger)
             : base(unitOfWork, sysGrpRoleRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}