using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysGrpRoleService : BaseService<SysGrpRole>, ISysGrpRoleService
    {
        public SysGrpRoleService(IUnitOfWork unitOfWork, ISysGrpRoleRepository sysGrpRoleRepository)
             : base(unitOfWork, sysGrpRoleRepository)
        {

        }
    }
}