using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysRoleGrpUserService : BaseService<SysRoleGrpUser>, ISysRoleGrpUserService
    {
        ISysRoleGrpUserRepository _repository;

        public SysRoleGrpUserService(ISysRoleGrpUserRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}