using Entity;
using IRepository;
using IService;

namespace Service
{
    public class SysAttachmentService : BaseService<SysAttachment>, ISysAttachmentService
    {
        public SysAttachmentService(IUnitOfWork unitOfWork, ISysAttachmentRepository sysAttachmentRepository)
             : base(unitOfWork, sysAttachmentRepository)
        {

        }
    }
}