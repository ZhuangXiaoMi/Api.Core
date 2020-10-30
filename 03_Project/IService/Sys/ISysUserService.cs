using DTO;
using Entity;
using System.Threading.Tasks;

namespace IService
{
    /// <summary>
    /// ISysUserService
    /// </summary>	
    public interface ISysUserService : IBaseService<SysUser>
    {
        Task<ResultResDto<int>> InitAsync();

        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="req"></param>
        /// <returns></returns>
        ResultResDto<UserModel> CheckLogin(LoginReqDto req);
    }
}