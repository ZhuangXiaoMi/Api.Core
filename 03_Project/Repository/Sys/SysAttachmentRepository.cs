using Entity;
using IRepository;
using Repository.EF;

namespace Repository
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