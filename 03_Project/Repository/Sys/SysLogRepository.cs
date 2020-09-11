using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysLogRepository
    /// </summary>
    public class SysLogRepository : BaseRepository<SysLog>, ISysLogRepository
    {
        public SysLogRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}