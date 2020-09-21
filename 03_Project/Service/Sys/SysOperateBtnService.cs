using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysOperateBtnService : BaseService<SysOperateBtn>, ISysOperateBtnService
    {
        private readonly ILogger<SysOperateBtnService> _logger;

        public SysOperateBtnService(IUnitOfWork unitOfWork, ISysOperateBtnRepository sysOperateBtnRepository, LoginInfo loginInfo, ILogger<SysOperateBtnService> logger)
            : base(unitOfWork, sysOperateBtnRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}