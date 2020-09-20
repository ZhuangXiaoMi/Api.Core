using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysModuleFormService : BaseService<SysModuleForm>, ISysModuleFormService
    {
        public SysModuleFormService(IUnitOfWork unitOfWork, ISysModuleFormRepository sysModuleFormRepository)
            : base(unitOfWork, sysModuleFormRepository)
        {

        }
    }
}