using Microsoft.Extensions.DependencyInjection;
using System;

namespace Common
{
    /// <summary>
    /// 跨域请求 CORS
    /// </summary>
    public static class CorsService
    {
        public static void AddCorsService(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            services.AddCors(c =>
            {
                c.AddPolicy("LimitRequests", policy =>
                {
                    //支持多个域名端口，注意端口号后不要带/斜杆：比如localhost:8000/，是错的
                    //注意，http://127.0.0.1:1818 和 http://localhost:1818 是不一样的，尽量写两个
                    policy.WithOrigins(AppSettingsHelper.GetElement(new string[] { "Startup", "Cors", "IPs" }).Split(','))
                        .AllowAnyHeader()//允许任何头
                        .AllowAnyMethod();//允许任何方式
                        //.AllowAnyOrigin()//允许任何源
                        //.AllowCredentials()//允许cookie
                });
            });
        }
    }
}
