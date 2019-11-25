using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysGrpRoleService : BaseService<SysGrpRole>, ISysGrpRoleService
    {
        ISysGrpRoleRepository _repository;

        public SysGrpRoleService(ISysGrpRoleRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}