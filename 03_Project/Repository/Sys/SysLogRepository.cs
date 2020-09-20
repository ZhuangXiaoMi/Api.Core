using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysLogRepository
    /// </summary>
    public class SysLogRepository : BaseRepository<SysLog>, ISysLogRepository
    {
        public SysLogRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}