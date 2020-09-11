using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysOperateBtnService : BaseService<SysOperateBtn>, ISysOperateBtnService
    {
        public SysOperateBtnService(IUnitOfWork unitOfWork, ISysOperateBtnRepository sysOperateBtnRepository)
            : base(unitOfWork, sysOperateBtnRepository)
        {

        }
    }
}