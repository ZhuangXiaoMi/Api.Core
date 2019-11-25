using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysOperateBtnService : BaseService<SysOperateBtn>, ISysOperateBtnService
    {
        ISysOperateBtnRepository _repository;

        public SysOperateBtnService(ISysOperateBtnRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}