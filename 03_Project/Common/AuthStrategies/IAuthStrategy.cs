using Entity;
using System.Collections.Generic;

namespace Common
{
    public interface IAuthStrategy
    {
        /// <summary>
        /// 用户
        /// </summary>
        SysUser User { get; set; }

        /// <summary>
        /// 用户角色
        /// </summary>
        List<SysRole> Roles { get; }
    }
}
