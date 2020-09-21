using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysMenuService : BaseService<SysMenu>, ISysMenuService
    {
        private readonly ILogger<SysMenuService> _logger;

        public SysMenuService(IUnitOfWork unitOfWork, ISysMenuRepository sysMenuRepository, LoginInfo loginInfo, ILogger<SysMenuService> logger)
            : base(unitOfWork, sysMenuRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}