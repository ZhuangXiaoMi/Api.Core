using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysJobHistoryService : BaseService<SysJobHistory>, ISysJobHistoryService
    {
        public SysJobHistoryService(IUnitOfWork unitOfWork, ISysJobHistoryRepository sysJobHistoryRepository)
            : base(unitOfWork, sysJobHistoryRepository)
        {

        }
    }
}