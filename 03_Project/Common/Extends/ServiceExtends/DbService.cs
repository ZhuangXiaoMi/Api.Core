using Microsoft.Extensions.DependencyInjection;
using System;

namespace Common
{
    /// <summary>
    /// Db 启动服务
    /// </summary>
    public static class DbService
    {
        public static void AddDbService(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            //services.AddScoped<Repository.SqlSugar.ApiDbContext>();
            //services.AddScoped<Repository.EF.ApiDbContext>();
            //services.AddDbContext<Repository.EF.ApiDbContext>();
        }
    }
}
