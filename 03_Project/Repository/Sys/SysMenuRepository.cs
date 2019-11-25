using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
	/// <summary>
	/// SysMenuRepository
	/// </summary>
    public class SysMenuRepository : BaseRepository<SysMenu>, ISysMenuRepository
    {
        public SysMenuRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}