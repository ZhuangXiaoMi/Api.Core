using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysJobRepository
    /// </summary>
    public class SysJobRepository : BaseRepository<SysJob>, ISysJobRepository
    {
        public SysJobRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}