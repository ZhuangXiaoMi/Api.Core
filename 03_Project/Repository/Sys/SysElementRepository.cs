using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysElementRepository
    /// </summary>
    public class SysElementRepository : BaseRepository<SysElement>, ISysElementRepository
    {
        public SysElementRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}