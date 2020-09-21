using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysLogService : BaseService<SysLog>, ISysLogService
    {
        private readonly ILogger<SysLogService> _logger;

        public SysLogService(IUnitOfWork unitOfWork, ISysLogRepository sysLogRepository, LoginInfo loginInfo, ILogger<SysLogService> logger)
            : base(unitOfWork, sysLogRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}