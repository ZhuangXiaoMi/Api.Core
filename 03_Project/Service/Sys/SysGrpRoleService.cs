using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysGrpRoleService : BaseService<SysGrpRole>, ISysGrpRoleService
    {
        public SysGrpRoleService(IUnitOfWork unitOfWork, ISysGrpRoleRepository sysGrpRoleRepository)
             : base(unitOfWork, sysGrpRoleRepository)
        {

        }
    }
}