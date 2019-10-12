using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Api.Core.Helper
{
    /// <summary>
    /// 自定义的认证中间件，[Authorize]无策略的授权报错，且无法验证过期时间
    /// </summary>
    public class JwtTokenAuth
    {
        /// <summary>
        /// 中间件必须要有next，让管道正常走下去
        /// </summary>
        private readonly RequestDelegate _next;

        public JwtTokenAuth(RequestDelegate next)
        {
            _next = next;
        }

        private void PreProceed(HttpContext next)
        {
            Console.WriteLine($"{DateTime.Now} middleware invoke preproceed");
            //...
        }
        private void PostProceed(HttpContext next)
        {
            Console.WriteLine($"{DateTime.Now} middleware invoke postproceed");
            //....
        }

        /// <summary>
        /// 自定义认证中间件，保存声明主体 ClaimsPrincipal
        /// </summary>
        /// <param name="httpContext"></param>
        /// <returns></returns>
        public Task Invoke(HttpContext httpContext)
        {
            PreProceed(httpContext);

            //检测是否包含'Authorization'请求头
            if (!httpContext.Request.Headers.ContainsKey("Authorization"))
            {
                PostProceed(httpContext);
                //直接返回http信道，没有指定身份验证方案，也没有发现默认挑战方案
                return _next(httpContext);
            }
            //var tokenHeader = httpContext.Request.Headers["Authorization"].ToString();
            var tokenHeader = httpContext.Request.Headers["Authorization"].ToString().Replace("Bearer ", "");

            try
            {
                if (tokenHeader.Length >= 128)
                {
                    TokenModelJWT tm = JwtHelper.SerializeJWT(tokenHeader);

                    //授权
                    var claimList = new List<Claim>();
                    var claim = new Claim(ClaimTypes.Role, tm.Role);
                    claimList.Add(claim);
                    var identity = new ClaimsIdentity(claimList);
                    var principal = new ClaimsPrincipal(identity);
                    httpContext.User = principal;//自定义认证中间件，手动配置声明主体
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"{DateTime.Now} middleware wrong:{e.Message}");
            }

            PostProceed(httpContext);

            return _next(httpContext);
        }
    }

    /// <summary>
    /// 中间件Helper，给当前模块的中间件取别名
    /// </summary>
    public static class MiddlewareHelpers
    {
        public static IApplicationBuilder UseJwtTokenAuth(this IApplicationBuilder app)
        {
            return app.UseMiddleware<JwtTokenAuth>();
        }
    }
}