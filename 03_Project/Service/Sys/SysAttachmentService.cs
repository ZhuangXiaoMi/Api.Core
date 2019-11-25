using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysAttachmentService : BaseService<SysAttachment>, ISysAttachmentService
    {
        ISysAttachmentRepository _repository;

        public SysAttachmentService(ISysAttachmentRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}