using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysAttachmentRepository
    /// </summary>
    public class SysAttachmentRepository : BaseRepository<SysAttachment>, ISysAttachmentRepository
    {
        public SysAttachmentRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}