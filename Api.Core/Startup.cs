using Api.Core.Helper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Api.Core
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IHostingEnvironment env)
        {
            Configuration = configuration;
            Env = env;
        }

        public IConfiguration Configuration { get; }
        public IHostingEnvironment Env { get; }
        private const string ApiName = "Core API";

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

            #region Startup.cs读取appsettings.json
            // 1.按节点访问，Startup类在构造函数已经注入Configuration(访问appsettings.json)，其它地方需要自己注入
            var AllowedHosts = Configuration["AllowedHosts"];
            var SqlServerConnection = Configuration.GetSection("AppSettings").GetSection("SqlServer")["ConnectionString"];
            var OracleConnection = Configuration["AppSettings:Oracle:ConnectionString"];
            var OracleConnection1 = AppSettingsHelper.GetElement(new string[] { "AppSettings", "Oracle", "ConnectionString" });
            var OracleConnection2 = AppSettingsHelper.GetElement("AppSettings", "Oracle", "ConnectionString");

            // 2.按对象访问
            var rootPath = Env.ContentRootPath;//D:\MySource\Api.Core\Api.Core
            //添加指定json文件，对应\Controllers\ValuesController.cs，Get()
            var builder = new ConfigurationBuilder()
               .SetBasePath(rootPath)
               .AddJsonFile("mysettings.json", optional: true, reloadOnChange: true)
               .AddEnvironmentVariables();
            var MyConfiguration = builder.Build();

            services.AddOptions();//注入IOptions<T>
            //services.Configure<AppSettingsConfig>(MyConfiguration.GetSection("AppSettings"));//指定节点
            services.Configure<AppSettingsJson>(MyConfiguration);//整个文件
            #endregion Startup.cs读取appsettings.json

            #region Swagger UI Service(NuGet："Swashbuckle.AspNetCore")
            var basePath = Microsoft.DotNet.PlatformAbstractions.ApplicationEnvironment.ApplicationBasePath;//D:\MySource\Api.Core\Api.Core\bin\Debug\netcoreapp2.2
            services.AddSwaggerGen(c =>
            {
                //"v1"上下一致
                c.SwaggerDoc("v1", new Info
                {
                    Version = "v0.1.0",
                    Title = ApiName,
                    Description = "接口说明文档",
                    TermsOfService = "None",
                    Contact = new Swashbuckle.AspNetCore.Swagger.Contact
                    {
                        Name = ApiName,
                        Email = "1009123099@qq.com",
                        Url = ""
                    }
                });

                #region 引入XML注释
                var xmlPath = Path.Combine(basePath, "Api.Core.xml");//项目属性->生成->输出->XML文档文件，对应文件名
                c.IncludeXmlComments(xmlPath, true);//默认第二个参数是false，这个是controller的注释，改为true

                #endregion 引入XML注释

                #region Token绑定到ConfigureServices
                //添加header验证信息
                //c.OperationFilter<SwaggerHeader>();

                // 发行人
                var IssuerName = (Configuration.GetSection("Audience"))["Issuer"];
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
            #endregion Swagger UI Service(NuGet："Swashbuckle.AspNetCore")

            #region 一、【简单授权】
            #region 1、基于角色的API授权
            // 1.【授权】:无需配置服务，只要在API层的controller，增加特性，注意:只能是角色的
            // [Authorize(Roles = "Admin")]

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
            var audienceConfig = Configuration.GetSection("Audience");
            var symmetricKeyAsBase64 = audienceConfig["Secret"];
            var keyByteArray = Encoding.ASCII.GetBytes(symmetricKeyAsBase64);
            var signingKey = new SymmetricSecurityKey(keyByteArray);

            //3、官方认证
            services.AddAuthentication(x =>
            {
                //配置默认的认证方案
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
                    ValidIssuer = audienceConfig["Issuer"],//必须，Token颁发机构-发行人
                    ValidateAudience = true,
                    ValidAudience = audienceConfig["Audience"],//必须，颁发给谁-订阅人
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero,//允许的服务器时间偏移量
                    //ValidIssuer、ValidAudience与TokenClaims中Issuer和Audience对比，不一致则验证失败
                    RequireExpirationTime = true,
                };

                //o.Events = new JwtBearerEvents()
                //{
                //    OnMessageReceived = context =>
                //     {

                //     }
                //};
            });
            #endregion 二、【官方认证】

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            // 注意顺序，放在处理异常中间件后，便于捕获异常
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            #region Swagger(NuGet："Swashbuckle.AspNetCore")
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint($"/swagger/v1/swagger.json", $"{ApiName} v1");
                //路径配置，设置为空，表示直接在根域名（localhost:8001）访问该文件，注意localhost:8001/swagger是访问不到的
                //launchSettings.json中把"launchUrl": "api/values"去掉，直接访问localhost:8001/index.html
                //PS：launchSettings.json中profiles对应调试方式，IIS调试/项目自带的Kestrel Web应用调式
                c.RoutePrefix = "";
            });
            #endregion Swagger(NuGet："Swashbuckle.AspNetCore")

            //弃用-开启自定义认证中间件，用官方验证方法。如想传User全局变量，还可以继续使用中间件
            //[Authorize]无策略的授权报错，且无法验证过期时间
            //app.UseJwtTokenAuth(); //或：app.UseMiddleware<JwtTokenAuth>();

            //官方认证，在ConfigureService配置认证服务(.AddAuthentication 和 .AddJwtBearer 二者缺一不可)
            //且Token传递时，必须带上"Bearer "特定字符串
            app.UseAuthentication();


            //HTTP管道有先后顺序，一定要写在 app.UseMvc(); 前，否则不起作用
            app.UseMvc();
        }
    }
}
