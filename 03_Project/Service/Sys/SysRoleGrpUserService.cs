using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysRoleGrpUserService : BaseService<SysRoleGrpUser>, ISysRoleGrpUserService
    {
        public SysRoleGrpUserService(IUnitOfWork unitOfWork, ISysRoleGrpUserRepository sysRoleGrpUserRepository)
            : base(unitOfWork, sysRoleGrpUserRepository)
        {

        }
    }
}