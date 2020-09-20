using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysMenuRepository
    /// </summary>
    public class SysMenuRepository : BaseRepository<SysMenu>, ISysMenuRepository
    {
        public SysMenuRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}