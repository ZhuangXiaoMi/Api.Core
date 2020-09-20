using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysElementService : BaseService<SysElement>, ISysElementService
    {
        public SysElementService(IUnitOfWork unitOfWork, ISysElementRepository sysElementRepository)
            : base(unitOfWork, sysElementRepository)
        {

        }
    }
}