using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysOperateBtnService : BaseService<SysOperateBtn>, ISysOperateBtnService
    {
        public SysOperateBtnService(IUnitOfWork unitOfWork, ISysOperateBtnRepository sysOperateBtnRepository)
            : base(unitOfWork, sysOperateBtnRepository)
        {

        }
    }
}