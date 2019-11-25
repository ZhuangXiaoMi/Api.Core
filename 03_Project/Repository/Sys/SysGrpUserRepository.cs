using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
	/// <summary>
	/// SysGrpUserRepository
	/// </summary>
    public class SysGrpUserRepository : BaseRepository<SysGrpUser>, ISysGrpUserRepository
    {
        public SysGrpUserRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}