using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysDictService : BaseService<SysDict>, ISysDictService
    {
        public SysDictService(IUnitOfWork unitOfWork, ISysDictRepository sysDictRepository)
            : base(unitOfWork, sysDictRepository)
        {

        }
    }
}