using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysUserRoleService : BaseService<SysUserRole>, ISysUserRoleService
    {
        public SysUserRoleService(IUnitOfWork unitOfWork, ISysUserRoleRepository sysUserRoleRepository)
            : base(unitOfWork, sysUserRoleRepository)
        {

        }
    }
}