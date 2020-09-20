using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysMenuService : BaseService<SysMenu>, ISysMenuService
    {
        public SysMenuService(IUnitOfWork unitOfWork, ISysMenuRepository sysMenuRepository)
            : base(unitOfWork, sysMenuRepository)
        {

        }
    }
}