using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysRoleService : BaseService<SysRole>, ISysRoleService
    {
        ISysRoleRepository _repository;

        public SysRoleService(ISysRoleRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}