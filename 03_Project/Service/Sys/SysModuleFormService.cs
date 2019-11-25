using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysModuleFormService : BaseService<SysModuleForm>, ISysModuleFormService
    {
        ISysModuleFormRepository _repository;

        public SysModuleFormService(ISysModuleFormRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}