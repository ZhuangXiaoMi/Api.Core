using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
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