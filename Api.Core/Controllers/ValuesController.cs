﻿using Api.Core.Helper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Api.Core.Controllers
{
    [Route("api/[controller]")]
    //[Route("api/[controller]/[action]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
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
        [Authorize]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2" };
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