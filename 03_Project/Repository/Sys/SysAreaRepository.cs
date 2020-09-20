using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
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