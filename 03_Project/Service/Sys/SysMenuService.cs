using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysMenuService : BaseService<SysMenu>, ISysMenuService
    {
        ISysMenuRepository _repository;

        public SysMenuService(ISysMenuRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}