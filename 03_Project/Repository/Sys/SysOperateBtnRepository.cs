using Entity.SysManage;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysOperateBtnRepository
    /// </summary>
    public class SysOperateBtnRepository : BaseRepository<SysOperateBtn>, ISysOperateBtnRepository
    {
        public SysOperateBtnRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}