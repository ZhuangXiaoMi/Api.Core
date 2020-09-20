using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysRoleService : BaseService<SysRole>, ISysRoleService
    {
        public SysRoleService(IUnitOfWork unitOfWork, ISysRoleRepository sysRoleRepository)
            : base(unitOfWork, sysRoleRepository)
        {

        }
    }
}