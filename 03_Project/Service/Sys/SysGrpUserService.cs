using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysGrpUserService : BaseService<SysGrpUser>, ISysGrpUserService
    {
        ISysGrpUserRepository _repository;

        public SysGrpUserService(ISysGrpUserRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}