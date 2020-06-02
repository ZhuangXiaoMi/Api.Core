using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysLogService : BaseService<SysLog>, ISysLogService
    {
        public SysLogService(IUnitOfWork unitOfWork, ISysLogRepository sysLogRepository)
            : base(unitOfWork, sysLogRepository)
        {

        }
    }
}