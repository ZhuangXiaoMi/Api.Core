using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysUserGrpUserService : BaseService<SysUserGrpUser>, ISysUserGrpUserService
    {
        ISysUserGrpUserRepository _repository;

        public SysUserGrpUserService(ISysUserGrpUserRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}