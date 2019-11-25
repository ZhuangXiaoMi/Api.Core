using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
	/// <summary>
	/// SysDeptRepository
	/// </summary>
    public class SysDeptRepository : BaseRepository<SysDept>, ISysDeptRepository
    {
        public SysDeptRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}