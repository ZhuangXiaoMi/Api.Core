using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysAreaService : BaseService<SysArea>, ISysAreaService
    {
        public SysAreaService(IUnitOfWork unitOfWork, ISysAreaRepository sysAreaRepository)
            : base(unitOfWork, sysAreaRepository)
        {

        }
    }
}