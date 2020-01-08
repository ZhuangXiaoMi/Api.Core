using Api.Core.AutoMapperHelper;
using AutoMapper;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace Api.Core.Extends
{
    /// <summary>
    /// AutoMapper 启动服务
    /// </summary>
    public static class AutoMapperService
    {
        public static void AddAutoMapperService(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            services.AddAutoMapper(typeof(AutoMapperConfig));
            AutoMapperConfig.RegisterMappings();
        }
    }
}
