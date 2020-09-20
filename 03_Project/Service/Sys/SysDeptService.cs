using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysDeptService : BaseService<SysDept>, ISysDeptService
    {
        public SysDeptService(IUnitOfWork unitOfWork, ISysDeptRepository sysDeptRepository)
            : base(unitOfWork, sysDeptRepository)
        {

        }
    }
}