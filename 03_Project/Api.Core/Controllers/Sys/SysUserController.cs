using Common;
using DTO;
using IService;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Api.Core.Controllers
{
    /// <summary>
    /// 用户表
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiGroup(GroupNameEnum.System)]
    public class SysUserController : BaseController
    {
        private readonly ISysUserService _sysUserService;

        public SysUserController(ISysUserService sysUserService)
        {
            _sysUserService = sysUserService;
        }

        ///// <summary>
        ///// 初始化
        ///// </summary>
        ///// <returns></returns>
        //[HttpGet]
        //[Route("/api/sys_user/init")]
        //public async Task<ResultResDto<int>> InitAsync()
        //    => await _sysUserService.InitAsync();

        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="req"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("/api/sys_user/login")]
        public ResultResDto<UserModel> CheckLogin([FromBody] LoginReqDto req)
            => _sysUserService.CheckLogin(req);

    }
}