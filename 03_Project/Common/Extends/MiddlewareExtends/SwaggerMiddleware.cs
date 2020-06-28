using Microsoft.AspNetCore.Builder;
using System;
using System.IO;
using System.Linq;
using System.Reflection;

namespace Common
{
    public static class SwaggerMiddleware
    {
        /// <summary>
        /// Swagger(NuGet："Swashbuckle.AspNetCore")
        /// </summary>
        /// <param name="app"></param>
        public static void UseSwaggerConfigure(this IApplicationBuilder app, Func<Stream> streamHtml)
        {
            app.UseSwagger();
            app.UseSwaggerUI(options =>
            {
                //遍历ApiGroupNames所有枚举值生成接口文档
                typeof(GroupNameEnum).GetFields(BindingFlags.Public | BindingFlags.Static).ToList().ForEach(group =>
                {
                    //获取枚举值上的特性
                    var info = group.GetCustomAttributes(typeof(GroupInfoAttribute), false).OfType<GroupInfoAttribute>().FirstOrDefault();
                    options.SwaggerEndpoint($"/swagger/{group.Name}/swagger.json", info != null ? info.Title : group.Name);
                    options.IndexStream = streamHtml;
                    //路径配置，设置为空，表示直接在根域名（localhost:8001）访问该文件，注意localhost:8001/swagger是访问不到的
                    //launchSettings.json中把"launchUrl": "api/values"去掉，直接访问localhost:8001/index.html
                    //PS：launchSettings.json中profiles对应调试方式，IIS调试/项目自带的Kestrel Web应用调式
                    options.RoutePrefix = "";

                });
                options.SwaggerEndpoint("/swagger/NoGroup/swagger.json", "无分组");
            });
        }
    }
}
