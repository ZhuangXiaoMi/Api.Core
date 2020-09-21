using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysJobHistoryService : BaseService<SysJobHistory>, ISysJobHistoryService
    {
        private readonly ILogger<SysJobHistoryService> _logger;

        public SysJobHistoryService(IUnitOfWork unitOfWork, ISysJobHistoryRepository sysJobHistoryRepository, LoginInfo loginInfo, ILogger<SysJobHistoryService> logger)
            : base(unitOfWork, sysJobHistoryRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}