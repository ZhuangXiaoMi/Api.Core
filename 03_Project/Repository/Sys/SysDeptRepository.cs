using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysDeptRepository
    /// </summary>
    public class SysDeptRepository : BaseRepository<SysDept>, ISysDeptRepository
    {
        public SysDeptRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}