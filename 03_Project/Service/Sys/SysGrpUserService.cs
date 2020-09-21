using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysGrpUserService : BaseService<SysGrpUser>, ISysGrpUserService
    {
        private readonly ILogger<SysGrpUserService> _logger;

        public SysGrpUserService(IUnitOfWork unitOfWork, ISysGrpUserRepository sysGrpUserRepository, LoginInfo loginInfo, ILogger<SysGrpUserService> logger)
            : base(unitOfWork, sysGrpUserRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}