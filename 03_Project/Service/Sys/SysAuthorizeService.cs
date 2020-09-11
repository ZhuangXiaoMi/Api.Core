using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysAuthorizeService : BaseService<SysAuthorize>, ISysAuthorizeService
    {
        public SysAuthorizeService(IUnitOfWork unitOfWork, ISysAuthorizeRepository sysAuthorizeRepository)
            : base(unitOfWork, sysAuthorizeRepository)
        {

        }
    }
}