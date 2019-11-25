using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
	/// <summary>
	/// SysElementRepository
	/// </summary>
    public class SysElementRepository : BaseRepository<SysElement>, ISysElementRepository
    {
        public SysElementRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}