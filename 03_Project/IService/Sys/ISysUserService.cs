using DTO;
using Entity;

namespace IService
{
    /// <summary>
    /// ISysUserService
    /// </summary>	
    public interface ISysUserService : IBaseService<SysUser>
    {
        ResultResDto<int> Init();
    }
}