using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysAuthorizeRepository
    /// </summary>
    public class SysAuthorizeRepository : BaseRepository<SysAuthorize>, ISysAuthorizeRepository
    {
        public SysAuthorizeRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}