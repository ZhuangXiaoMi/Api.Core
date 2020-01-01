using Common.Helper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Text;
using System.Threading.Tasks;

namespace Api.Core.Extends
{
    /// <summary>
    /// 授权
    /// </summary>
    public static class AuthenticationService
    {
        public static void AddAuthenticationService(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            /***
             * 权限 = 授权 + 配置认证服务 + 开启授权中间件
             * 
             * Ps：不涉及数据库，仅在代码里配置授权，步骤如下
             * 1.【简单授权】：
             *      在指定接口配置特性，如：[Authorize(Roles = "Admin,System,Others")]
             *      逗号分隔太长可融合到简单策略里，见【2、基于策略的授权（简单版）】，特性：[Authorize(Policy = "Admin")]
             *      
             * 2.配置Bearer认证服务，见【官方认证】
             * 3.开启中间件
             */

            #region 一、【简单授权】
            #region 1、基于角色的API授权
            // 1.【授权】:无需配置服务，只要在API层的controller，增加特性，注意:只能是角色的
            // [Authorize(Roles = "Admin,System,Others")]

            // 2.【认证】:在configure配置中间件，app.UseMiddleware<JwtTokenAuth>();
            // 如需验证过期时间，还要第三种方法，官方认证
            #endregion 1、基于角色的API授权

            #region 2、基于策略的授权（简单版）
            // 1.【授权】:与第一种类似，好处是不用在controller中，写多个roles
            // [Authorize(Policy = "Admin")]
            services.AddAuthorization(options =>
            {
                options.AddPolicy("Client", policy => policy.RequireRole("Client").Build());
                options.AddPolicy("Admin", policy => policy.RequireRole("Admin").Build());
                options.AddPolicy("SystemOrAdmin", policy => policy.RequireRole("Admin", "System"));
            });

            // 2.【认证】:在configure配置中间件，app.UseMiddleware<JwtTokenAuth>();
            // 如需验证过期时间，还要第三种方法，官方认证
            #endregion 2、基于策略的授权（简单版）
            #endregion 一、【简单授权】

            #region 二、【官方认证】
            //读取配置文件
            var symmetricKeyAsBase64 = AppSettingsHelper.GetElement(new string[] { "Audience", "Secret" });
            var keyByteArray = Encoding.ASCII.GetBytes(symmetricKeyAsBase64);
            var signingKey = new SymmetricSecurityKey(keyByteArray);

            //3、官方认证
            services.AddAuthentication(x =>
            {
                //配置默认的认证方案
                x.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(o =>
            {
                o.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = signingKey,//必须，签名秘钥
                    ValidateIssuer = true,
                    ValidIssuer = AppSettingsHelper.GetElement(new string[] { "Audience", "Issuer" }),//必须，Token颁发机构-发行人
                    ValidateAudience = true,
                    ValidAudience = AppSettingsHelper.GetElement(new string[] { "Audience", "Audience" }),//必须，颁发给谁-订阅人
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.FromSeconds(30),//允许的服务器时间偏移量
                    //ValidIssuer、ValidAudience与TokenClaims中Issuer和Audience对比，不一致则验证失败
                    RequireExpirationTime = true,
                };

                o.Events = new JwtBearerEvents
                {
                    OnAuthenticationFailed = context =>
                    {
                        //过期把<是否过期>添加到返回头信息中
                        if (context.Exception.GetType() == typeof(SecurityTokenExpiredException))
                        {
                            context.Response.Headers.Add("Token-Expired", "true");
                        }
                        return Task.CompletedTask;
                    }
                };
            });
            #endregion 二、【官方认证】
        }
    }
}
