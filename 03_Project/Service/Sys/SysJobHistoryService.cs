using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysJobHistoryService : BaseService<SysJobHistory>, ISysJobHistoryService
    {
        ISysJobHistoryRepository _repository;

        public SysJobHistoryService(ISysJobHistoryRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}