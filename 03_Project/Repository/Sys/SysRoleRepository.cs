using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysRoleRepository
    /// </summary>
    public class SysRoleRepository : BaseRepository<SysRole>, ISysRoleRepository
    {
        public SysRoleRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}