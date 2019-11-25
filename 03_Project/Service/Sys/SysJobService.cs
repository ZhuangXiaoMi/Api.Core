using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysJobService : BaseService<SysJob>, ISysJobService
    {
        ISysJobRepository _repository;

        public SysJobService(ISysJobRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}