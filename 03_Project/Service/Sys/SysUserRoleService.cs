using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysUserRoleService : BaseService<SysUserRole>, ISysUserRoleService
    {
        private readonly ILogger<SysUserRoleService> _logger;

        public SysUserRoleService(IUnitOfWork unitOfWork, ISysUserRoleRepository sysUserRoleRepository, LoginInfo loginInfo, ILogger<SysUserRoleService> logger)
            : base(unitOfWork, sysUserRoleRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}