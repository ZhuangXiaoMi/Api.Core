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

        ResultResDto<UserModel> CheckLogin(LoginReqDto req);
    }
}