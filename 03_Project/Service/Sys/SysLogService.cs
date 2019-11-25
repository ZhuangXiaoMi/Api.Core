using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysLogService : BaseService<SysLog>, ISysLogService
    {
        ISysLogRepository _repository;

        public SysLogService(ISysLogRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}