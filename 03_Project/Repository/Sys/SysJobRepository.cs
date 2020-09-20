using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
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