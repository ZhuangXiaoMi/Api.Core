using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysGrpUserService : BaseService<SysGrpUser>, ISysGrpUserService
    {
        public SysGrpUserService(IUnitOfWork unitOfWork, ISysGrpUserRepository sysGrpUserRepository)
            : base(unitOfWork, sysGrpUserRepository)
        {

        }
    }
}