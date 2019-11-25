using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysUserRoleService : BaseService<SysUserRole>, ISysUserRoleService
    {
        ISysUserRoleRepository _repository;

        public SysUserRoleService(ISysUserRoleRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}