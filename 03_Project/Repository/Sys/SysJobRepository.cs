using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
	/// <summary>
	/// SysJobRepository
	/// </summary>
    public class SysJobRepository : BaseRepository<SysJob>, ISysJobRepository
    {
        public SysJobRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}