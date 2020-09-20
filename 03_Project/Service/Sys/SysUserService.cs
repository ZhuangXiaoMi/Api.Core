using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysUserService : BaseService<SysUser>, ISysUserService
    {
        public SysUserService(IUnitOfWork unitOfWork, ISysUserRepository sysUserRepository)
            : base(unitOfWork, sysUserRepository)
        {

        }
    }
}