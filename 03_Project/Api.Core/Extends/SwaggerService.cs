using Common.Helper;
using Microsoft.Extensions.DependencyInjection;
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
                c.SwaggerDoc("v1", new Info
                {
                    Version = "v0.1.0",
                    Title = ApiName,
                    Description = "接口说明文档",
                    TermsOfService = "None",
                    Contact = new Contact
                    {
                        Name = ApiName,
                        Email = "1009123099@qq.com",
                        Url = ""
                    },
                    License = new License
                    {
                        Name = ApiName,
                        Url = ""
                    }
                });
                c.OrderActionsBy(o => o.RelativePath);

                #region 引入XML注释
                try
                {
                    var xmlPath = Path.Combine(basePath, "Api.Core.xml");//项目属性->生成->输出->XML文档文件，对应文件名
                    c.IncludeXmlComments(xmlPath, true);//默认第二个参数是false，这个是controller的注释，改为true

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
                c.AddSecurityRequirement(security);
                c.AddSecurityDefinition(IssuerName, new ApiKeyScheme
                {
                    Description = "JWT授权(数据将在请求头中进行传输)直接在下框中输入Bearer {token}（注意两者之间是一个空格）",
                    Name = "Authorization",//jwt默认的参数名称
                    In = "header",//jwt默认存放Authorization信息的位置(请求头中)
                    Type = "apiKey"
                });
                #endregion Token绑定到ConfigureServices

            });
        }
    }
}
