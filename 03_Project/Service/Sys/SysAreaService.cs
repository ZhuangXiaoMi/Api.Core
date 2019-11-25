using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysAreaService : BaseService<SysArea>, ISysAreaService
    {
        ISysAreaRepository _repository;

        public SysAreaService(ISysAreaRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}