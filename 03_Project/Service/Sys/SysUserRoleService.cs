using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysUserRoleService : BaseService<SysUserRole>, ISysUserRoleService
    {
        public SysUserRoleService(IUnitOfWork unitOfWork, ISysUserRoleRepository sysUserRoleRepository)
            : base(unitOfWork, sysUserRoleRepository)
        {

        }
    }
}