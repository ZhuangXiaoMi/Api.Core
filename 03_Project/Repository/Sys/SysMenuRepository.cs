using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysMenuRepository
    /// </summary>
    public class SysMenuRepository : BaseRepository<SysMenu>, ISysMenuRepository
    {
        public SysMenuRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}