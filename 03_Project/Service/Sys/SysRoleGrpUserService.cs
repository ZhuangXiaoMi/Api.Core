using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysRoleGrpUserService : BaseService<SysRoleGrpUser>, ISysRoleGrpUserService
    {
        public SysRoleGrpUserService(IUnitOfWork unitOfWork, ISysRoleGrpUserRepository sysRoleGrpUserRepository)
            : base(unitOfWork, sysRoleGrpUserRepository)
        {

        }
    }
}