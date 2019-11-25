using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysDeptService : BaseService<SysDept>, ISysDeptService
    {
        ISysDeptRepository _repository;

        public SysDeptService(ISysDeptRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}