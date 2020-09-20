using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysJobHistoryRepository
    /// </summary>
    public class SysJobHistoryRepository : BaseRepository<SysJobHistory>, ISysJobHistoryRepository
    {
        public SysJobHistoryRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}