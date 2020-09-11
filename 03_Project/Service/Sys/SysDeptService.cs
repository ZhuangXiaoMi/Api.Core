using Entity;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysDeptService : BaseService<SysDept>, ISysDeptService
    {
        public SysDeptService(IUnitOfWork unitOfWork, ISysDeptRepository sysDeptRepository)
            : base(unitOfWork, sysDeptRepository)
        {

        }
    }
}