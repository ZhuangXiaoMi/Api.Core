using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysElementService : BaseService<SysElement>, ISysElementService
    {
        ISysElementRepository _repository;

        public SysElementService(ISysElementRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}