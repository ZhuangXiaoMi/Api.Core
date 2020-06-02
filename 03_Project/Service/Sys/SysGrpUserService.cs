using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysGrpUserService : BaseService<SysGrpUser>, ISysGrpUserService
    {
        public SysGrpUserService(IUnitOfWork unitOfWork, ISysGrpUserRepository sysGrpUserRepository)
            : base(unitOfWork, sysGrpUserRepository)
        {

        }
    }
}