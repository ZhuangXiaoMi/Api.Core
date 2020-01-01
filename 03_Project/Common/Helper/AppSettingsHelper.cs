using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.Options;
using System;
using System.IO;
using System.Linq;

namespace Common.Helper
{
    /// <summary>
    /// appsettings.json操作类
    /// </summary>
    public class AppSettingsHelper
    {
        static IConfiguration Configuration { get; set; }
        //internal static IOptions<AppSettingsJson> Setting { get; set; }

        public AppSettingsHelper(string contentRootPath)
        {
            string path = "appsettings.json";
            //string path = $"appsettings.{Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT")}.json";//配置文件根据环境变量分开

            Configuration = new ConfigurationBuilder()
                //.Add(new JsonConfigurationSource { Path = path, ReloadOnChange = true })
                //ReloadOnChange，修改appsettings.json重新加载
                //注意：appsetting.json 文件->右键->属性->复制到输出目录->始终复制，D:\MySource\Api.Core\Api.Core\bin\Debug\netcoreapp2.2

                .SetBasePath(contentRootPath)//D:\MySource\Api.Core\Api.Core
                .Add(new JsonConfigurationSource { Path = path, Optional = false, ReloadOnChange = true })
                //读取程序根目录的json文件，而非bin目录下，不用设置复制属性
                .Build();

            //获取方式
            //var AllowedHosts = Configuration["AllowedHosts"];
            //var SqlServerConnection = Configuration.GetSection("AppSettings").GetSection("SqlServer")["ConnectionString"];
            //var OracleConnection = Configuration["AppSettings:Oracle:ConnectionString"];
        }

        /// <summary>
        /// 获取appsettings.json指定节点值
        /// 参数1：new string[] { "XXX", "YYY" })
        /// 参数2："XXX", "YYY"
        /// </summary>
        /// <param name="sections">节点配置</param>
        /// <returns></returns>
        public static string GetElement(params string[] sections)
        {
            try
            {
                if (sections.Any())
                {
                    //Configuration["AppSettings:Oracle:ConnectionString"];
                    return Configuration[string.Join(":", sections)];
                }
            }
            catch (Exception e) { }

            return "";
        }
    }
}
