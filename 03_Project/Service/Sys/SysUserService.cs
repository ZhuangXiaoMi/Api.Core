using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysUserService : BaseService<SysUser>, ISysUserService
    {
        ISysUserRepository _repository;

        public SysUserService(ISysUserRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}