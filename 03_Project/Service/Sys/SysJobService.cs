using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysJobService : BaseService<SysJob>, ISysJobService
    {
        public SysJobService(IUnitOfWork unitOfWork, ISysJobRepository sysJobRepository)
            : base(unitOfWork, sysJobRepository)
        {

        }
    }
}