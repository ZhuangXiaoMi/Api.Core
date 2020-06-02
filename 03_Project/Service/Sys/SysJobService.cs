using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysJobService : BaseService<SysJob>, ISysJobService
    {
        public SysJobService(IUnitOfWork unitOfWork, ISysJobRepository sysJobRepository)
            : base(unitOfWork, sysJobRepository)
        {

        }
    }
}