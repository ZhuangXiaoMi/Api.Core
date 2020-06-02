using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysAttachmentService : BaseService<SysAttachment>, ISysAttachmentService
    {
        public SysAttachmentService(IUnitOfWork unitOfWork, ISysAttachmentRepository sysAttachmentRepository)
             : base(unitOfWork, sysAttachmentRepository)
        {

        }
    }
}