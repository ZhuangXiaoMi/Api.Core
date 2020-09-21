using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysDeptService : BaseService<SysDept>, ISysDeptService
    {
        private readonly ILogger<SysDeptService> _logger;

        public SysDeptService(IUnitOfWork unitOfWork, ISysDeptRepository sysDeptRepository, LoginInfo loginInfo, ILogger<SysDeptService> logger)
            : base(unitOfWork, sysDeptRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}