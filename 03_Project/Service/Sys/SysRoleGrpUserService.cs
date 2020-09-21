using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysRoleGrpUserService : BaseService<SysRoleGrpUser>, ISysRoleGrpUserService
    {
        private readonly ILogger<SysRoleGrpUserService> _logger;

        public SysRoleGrpUserService(IUnitOfWork unitOfWork, ISysRoleGrpUserRepository sysRoleGrpUserRepository, LoginInfo loginInfo, ILogger<SysRoleGrpUserService> logger)
            : base(unitOfWork, sysRoleGrpUserRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}