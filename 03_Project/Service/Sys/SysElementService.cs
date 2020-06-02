using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysElementService : BaseService<SysElement>, ISysElementService
    {
        public SysElementService(IUnitOfWork unitOfWork, ISysElementRepository sysElementRepository)
            : base(unitOfWork, sysElementRepository)
        {

        }
    }
}