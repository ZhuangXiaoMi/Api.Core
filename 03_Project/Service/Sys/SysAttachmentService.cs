using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;

namespace Service
{
    public class SysAttachmentService : BaseService<SysAttachment>, ISysAttachmentService
    {
        private readonly ILogger<SysAttachmentService> _logger;

        public SysAttachmentService(IUnitOfWork unitOfWork, ISysAttachmentRepository sysAttachmentRepository, LoginInfo loginInfo, ILogger<SysAttachmentService> logger)
             : base(unitOfWork, sysAttachmentRepository, loginInfo)
        {
            _logger = logger;
        }
    }
}