using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysMenuService : BaseService<SysMenu>, ISysMenuService
    {
        public SysMenuService(IUnitOfWork unitOfWork, ISysMenuRepository sysMenuRepository)
            : base(unitOfWork, sysMenuRepository)
        {

        }
    }
}