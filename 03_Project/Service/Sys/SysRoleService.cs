using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysRoleService : BaseService<SysRole>, ISysRoleService
    {
        public SysRoleService(IUnitOfWork unitOfWork, ISysRoleRepository sysRoleRepository)
            : base(unitOfWork, sysRoleRepository)
        {

        }
    }
}