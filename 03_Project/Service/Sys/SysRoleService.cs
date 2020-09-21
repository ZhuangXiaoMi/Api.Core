using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysRoleService : BaseService<SysRole>, ISysRoleService
    {
        private readonly ILogger<SysRoleService> _logger;

        public SysRoleService(IUnitOfWork unitOfWork, ISysRoleRepository sysRoleRepository, LoginInfo loginInfo, ILogger<SysRoleService> logger)
            : base(unitOfWork, sysRoleRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}