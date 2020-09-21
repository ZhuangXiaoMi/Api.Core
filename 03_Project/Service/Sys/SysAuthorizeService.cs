using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysAuthorizeService : BaseService<SysAuthorize>, ISysAuthorizeService
    {
        private readonly ILogger<SysAuthorizeService> _logger;

        public SysAuthorizeService(IUnitOfWork unitOfWork, ISysAuthorizeRepository sysAuthorizeRepository, LoginInfo loginInfo, ILogger<SysAuthorizeService> logger)
            : base(unitOfWork, sysAuthorizeRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}