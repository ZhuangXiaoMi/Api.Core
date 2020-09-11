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
        public SysAttachmentRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}