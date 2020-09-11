using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysUserService : BaseService<SysUser>, ISysUserService
    {
        public SysUserService(IUnitOfWork unitOfWork, ISysUserRepository sysUserRepository)
            : base(unitOfWork, sysUserRepository)
        {

        }

        public string Print()
        {
            return "888";
        }
    }
}