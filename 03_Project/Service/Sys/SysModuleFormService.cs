using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysModuleFormService : BaseService<SysModuleForm>, ISysModuleFormService
    {
        public SysModuleFormService(IUnitOfWork unitOfWork, ISysModuleFormRepository sysModuleFormRepository)
            : base(unitOfWork, sysModuleFormRepository)
        {

        }
    }
}