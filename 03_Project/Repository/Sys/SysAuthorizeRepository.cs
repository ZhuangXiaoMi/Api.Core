using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysAuthorizeRepository
    /// </summary>
    public class SysAuthorizeRepository : BaseRepository<SysAuthorize>, ISysAuthorizeRepository
    {
        public SysAuthorizeRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}