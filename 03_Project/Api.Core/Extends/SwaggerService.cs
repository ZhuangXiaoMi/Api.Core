using Common.Helper;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.Collections.Generic;
using System.IO;

namespace Api.Core.Extends
{
    /// <summary>
    /// Swagger UI Service(NuGet："Swashbuckle.AspNetCore")
    /// </summary>
    public static class SwaggerService
    {
        public static void AddSwaggerService(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            var basePath = AppContext.BaseDirectory;
            //var basePath = Microsoft.DotNet.PlatformAbstractions.ApplicationEnvironment.ApplicationBasePath;//D:\MySource\Api.Core\Api.Core\bin\Debug\netcoreapp2.2
            var ApiName = AppSettingsHelper.GetElement(new string[] { "Startup", "ApiName" });

            services.AddSwaggerGen(c =>
            {
                //"v1"上下一致
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v0.1.0",
                    Title = ApiName,
                    Description = "接口说明文档",
                    Contact = new OpenApiContact
                    {
                        Name = ApiName,
                        Email = "1009123099@qq.com",
                        Url = new Uri("")
                    },
                    License = new OpenApiLicense
                    {
                        Name = ApiName,
                        Url = new Uri("")
                    }
                });
                c.OrderActionsBy(o => o.RelativePath);

                #region 引入XML注释
                try
                {
                    var xmlPath = Path.Combine(basePath, "Api.Core.xml");//项目属性->生成->输出->XML文档文件，对应文件名
                    c.IncludeXmlComments(xmlPath, true);//默认第二个参数是false，这个是controller的注释，改为true

                    var xmlEntityPath = Path.Combine(basePath, "Entity.xml");
                    c.IncludeXmlComments(xmlEntityPath, true);
                }
                catch (Exception ex)
                {

                }
                #endregion 引入XML注释

                #region Token绑定到ConfigureServices
                //添加header验证信息
                //c.OperationFilter<SwaggerHeader>();

                // 发行人
                var IssuerName = AppSettingsHelper.GetElement(new string[] { "Audience", "Issuer" });
                var security = new Dictionary<string, IEnumerable<string>>
                {
                    {
                        IssuerName, new string[] { }
                    },
                };
                //c.AddSecurityRequirement(security);
                c.AddSecurityDefinition(IssuerName, new OpenApiSecurityScheme
                {
                    Description = "JWT授权(数据将在请求头中进行传输)直接在下框中输入Bearer {token}（注意两者之间是一个空格）",
                    Name = "Authorization",//jwt默认的参数名称
                    In = ParameterLocation.Header,//jwt默认存放Authorization信息的位置(请求头中)
                    Type = SecuritySchemeType.ApiKey
                });
                #endregion Token绑定到ConfigureServices

            });
        }
    }
}
