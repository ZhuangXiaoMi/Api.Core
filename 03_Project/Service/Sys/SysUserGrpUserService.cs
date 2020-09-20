using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysUserGrpUserService : BaseService<SysUserGrpUser>, ISysUserGrpUserService
    {
        public SysUserGrpUserService(IUnitOfWork unitOfWork, ISysUserGrpUserRepository sysUserGrpUserRepository)
             : base(unitOfWork, sysUserGrpUserRepository)
        {

        }
    }
}