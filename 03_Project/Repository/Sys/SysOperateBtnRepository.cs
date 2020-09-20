using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysOperateBtnRepository
    /// </summary>
    public class SysOperateBtnRepository : BaseRepository<SysOperateBtn>, ISysOperateBtnRepository
    {
        public SysOperateBtnRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}