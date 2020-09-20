using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysRoleGrpUserRepository
    /// </summary>
    public class SysRoleGrpUserRepository : BaseRepository<SysRoleGrpUser>, ISysRoleGrpUserRepository
    {
        public SysRoleGrpUserRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}