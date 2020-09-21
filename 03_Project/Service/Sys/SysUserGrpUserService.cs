using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysUserGrpUserService : BaseService<SysUserGrpUser>, ISysUserGrpUserService
    {
        private readonly ILogger<SysUserGrpUserService> _logger;

        public SysUserGrpUserService(IUnitOfWork unitOfWork, ISysUserGrpUserRepository sysUserGrpUserRepository, LoginInfo loginInfo, ILogger<SysUserGrpUserService> logger)
             : base(unitOfWork, sysUserGrpUserRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}