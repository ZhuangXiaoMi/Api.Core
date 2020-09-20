using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysUserRoleRepository
    /// </summary>
    public class SysUserRoleRepository : BaseRepository<SysUserRole>, ISysUserRoleRepository
    {
        public SysUserRoleRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}