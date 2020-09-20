using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysAuthorizeService : BaseService<SysAuthorize>, ISysAuthorizeService
    {
        public SysAuthorizeService(IUnitOfWork unitOfWork, ISysAuthorizeRepository sysAuthorizeRepository)
            : base(unitOfWork, sysAuthorizeRepository)
        {

        }
    }
}