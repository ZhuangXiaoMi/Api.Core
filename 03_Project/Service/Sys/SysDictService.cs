using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysDictService : BaseService<SysDict>, ISysDictService
    {
        private readonly ILogger<SysDictService> _logger;

        public SysDictService(IUnitOfWork unitOfWork, ISysDictRepository sysDictRepository, LoginInfo loginInfo, ILogger<SysDictService> logger)
            : base(unitOfWork, sysDictRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}