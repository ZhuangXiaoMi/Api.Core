using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysJobHistoryService : BaseService<SysJobHistory>, ISysJobHistoryService
    {
        public SysJobHistoryService(IUnitOfWork unitOfWork, ISysJobHistoryRepository sysJobHistoryRepository)
            : base(unitOfWork, sysJobHistoryRepository)
        {

        }
    }
}