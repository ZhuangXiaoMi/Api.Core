using DTO;
using Entity;

namespace IService
{
    /// <summary>
    /// ISysAreaService
    /// </summary>	
    public interface ISysAreaService : IBaseService<SysArea>
    {
        ResultResDto<int> Init();
    }
}