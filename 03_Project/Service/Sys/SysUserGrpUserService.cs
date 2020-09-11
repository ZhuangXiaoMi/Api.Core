using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysUserGrpUserService : BaseService<SysUserGrpUser>, ISysUserGrpUserService
    {
        public SysUserGrpUserService(IUnitOfWork unitOfWork, ISysUserGrpUserRepository sysUserGrpUserRepository)
             : base(unitOfWork, sysUserGrpUserRepository)
        {

        }
    }
}