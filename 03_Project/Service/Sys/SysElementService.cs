using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysElementService : BaseService<SysElement>, ISysElementService
    {
        private readonly ILogger<SysElementService> _logger;

        public SysElementService(IUnitOfWork unitOfWork, ISysElementRepository sysElementRepository, LoginInfo loginInfo, ILogger<SysElementService> logger)
            : base(unitOfWork, sysElementRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}