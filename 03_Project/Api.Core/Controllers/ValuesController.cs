using Api.Core.Helper;
using DTO;
using Entity.SysManage;
using IService.Sys;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace Api.Core.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    //[Route("api/[controller]/[action]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly ILogger<SysUser> _logger;
        private static IConfiguration _configuration;//按节点访问
        private static IOptions<AppSettingsJson> _setting;//按对象访问
        //private ISysUserService _sysUserService;

        public ValuesController(ILogger<SysUser> logger, IConfiguration configuration, IOptions<AppSettingsJson> setting)//, ISysUserService sysUserService)
        {
            _logger = logger;
            _configuration = configuration;//读取appsettings.json
            _setting = setting;//读取mysettings.json
            //_sysUserService = sysUserService;
        }

        /// <summary>
        /// 登录接口：获取 Access_Token，然后 Authorize
        /// </summary>
        /// <param name="name">账号</param>
        /// <param name="pass">密码</param>
        /// <returns></returns>
        //[ApiExplorerSettings(IgnoreApi = true)]//隐藏控制器或方法特性
        [HttpGet("{name}/{pass}")]//中间必须用'/'或字符串分隔
        public async Task<object> GetJWTToken(string name, string pass)
        {
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(pass))
            {
                return new JsonResult(new
                {
                    Status = false,
                    message = "用户名或密码不能为空"
                });
            }

            string jwtStr = string.Empty;
            bool suc = false;

            // 获取用户的角色名
            var userRole = await Task<string>.Run(() => name);
            if (userRole != null)
            {
                // 将用户id和角色名，作为单独的自定义变量封装进 token 字符串中。
                //TokenModelJWT tokenModel = new TokenModelJWT { Uid = 1, Role = userRole };//或
                TokenModelJWT tokenModel = new TokenModelJWT()//如果类中只有有参构造函数，则需要在“()”中添加参数
                {
                    Uid = 1,
                    Role = userRole
                };
                jwtStr = JwtHelper.IssueJWT(tokenModel);//登录，获取到一定规则的 Token 令牌
                suc = true;
            }
            else
            {
                jwtStr = "login fail!!!";
            }

            return Ok(new
            {
                success = suc,
                token = jwtStr
            });
        }


        /// <summary>
        /// 获取（登录角色认证）
        /// GET api/values
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        //[Authorize]
        public async Task<IList<SysUser>> Get()
        {
            //_configuration读取appsettings.json
            var AllowedHosts = _configuration["AllowedHosts"];
            var SqlServerConnection = _configuration.GetSection("AppSettings").GetSection("SqlServer")["ConnectionString"];
            var MySqlServerConnection = _setting.Value.AppSettings.SqlServer.ConnectionString;//读取mysettings.json

            return null;//await _sysUserService.Query(o => o.Id == 1, p => p.Account);
        }

        /// <summary>
        /// 根据id获取（管理员策略认证）
        /// GET api/values/5
        /// </summary>
        /// <param name="id">主键</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        //[Authorize(Roles = "Admin")]
        //[Authorize(Roles = "System")]
        [Authorize(Policy = "Admin")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        /// <summary>
        /// 新增
        /// POST api/values
        /// </summary>
        /// <param name="value">表单数据</param>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        /// <summary>
        /// 修改
        /// PUT api/values/5
        /// </summary>
        /// <param name="id">主键</param>
        /// <param name="value">表单数据</param>
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        /// <summary>
        /// 删除
        /// DELETE api/values/5
        /// </summary>
        /// <param name="id">主键</param>
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
