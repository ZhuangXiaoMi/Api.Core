using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysDictService : BaseService<SysDict>, ISysDictService
    {
        public SysDictService(IUnitOfWork unitOfWork, ISysDictRepository sysDictRepository)
            : base(unitOfWork, sysDictRepository)
        {

        }
    }
}