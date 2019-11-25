using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
	/// <summary>
	/// SysJobHistoryRepository
	/// </summary>
    public class SysJobHistoryRepository : BaseRepository<SysJobHistory>, ISysJobHistoryRepository
    {
        public SysJobHistoryRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}