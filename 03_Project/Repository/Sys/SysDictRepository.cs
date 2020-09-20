using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
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