using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysAreaService : BaseService<SysArea>, ISysAreaService
    {
        public SysAreaService(IUnitOfWork unitOfWork, ISysAreaRepository sysAreaRepository)
            : base(unitOfWork, sysAreaRepository)
        {

        }
    }
}