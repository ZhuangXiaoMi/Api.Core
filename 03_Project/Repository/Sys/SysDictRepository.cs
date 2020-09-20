using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysDictRepository
    /// </summary>
    public class SysDictRepository : BaseRepository<SysDict>, ISysDictRepository
    {
        public SysDictRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}