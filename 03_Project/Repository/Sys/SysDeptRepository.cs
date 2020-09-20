using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysDeptRepository
    /// </summary>
    public class SysDeptRepository : BaseRepository<SysDept>, ISysDeptRepository
    {
        public SysDeptRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}