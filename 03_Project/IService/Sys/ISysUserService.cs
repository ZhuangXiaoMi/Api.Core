using Entity;
using IService.Base;

namespace IService.Sys
{
    /// <summary>
    /// ISysUserService
    /// </summary>	
    public interface ISysUserService : IBaseService<SysUser>
    {
        string Print();
    }
}