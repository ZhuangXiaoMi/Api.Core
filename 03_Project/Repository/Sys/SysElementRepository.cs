using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysElementRepository
    /// </summary>
    public class SysElementRepository : BaseRepository<SysElement>, ISysElementRepository
    {
        public SysElementRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}