using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysAuthorizeService : BaseService<SysAuthorize>, ISysAuthorizeService
    {
        ISysAuthorizeRepository _repository;

        public SysAuthorizeService(ISysAuthorizeRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}