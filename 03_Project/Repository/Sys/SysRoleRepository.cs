using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysRoleRepository
    /// </summary>
    public class SysRoleRepository : BaseRepository<SysRole>, ISysRoleRepository
    {
        public SysRoleRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}