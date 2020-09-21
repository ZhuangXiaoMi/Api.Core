using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysJobService : BaseService<SysJob>, ISysJobService
    {
        private readonly ILogger<SysJobService> _logger;

        public SysJobService(IUnitOfWork unitOfWork, ISysJobRepository sysJobRepository, LoginInfo loginInfo, ILogger<SysJobService> logger)
            : base(unitOfWork, sysJobRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}