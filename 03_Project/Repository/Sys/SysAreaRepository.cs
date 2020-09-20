using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysAreaRepository
    /// </summary>
    public class SysAreaRepository : BaseRepository<SysArea>, ISysAreaRepository
    {
        public SysAreaRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}