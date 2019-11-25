using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysDictService : BaseService<SysDict>, ISysDictService
    {
        ISysDictRepository _repository;

        public SysDictService(ISysDictRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}