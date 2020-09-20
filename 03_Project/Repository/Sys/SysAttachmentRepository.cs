using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysAttachmentRepository
    /// </summary>
    public class SysAttachmentRepository : BaseRepository<SysAttachment>, ISysAttachmentRepository
    {
        public SysAttachmentRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}