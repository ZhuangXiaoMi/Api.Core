using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysLogService : BaseService<SysLog>, ISysLogService
    {
        public SysLogService(IUnitOfWork unitOfWork, ISysLogRepository sysLogRepository)
            : base(unitOfWork, sysLogRepository)
        {

        }
    }
}