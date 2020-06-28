using Microsoft.AspNetCore.Mvc.ApiExplorer;
using System;

namespace Common
{
    /// <summary>
    /// 系统分组特性：Swagger 接口根据模块/版本分组
    /// 源地址：https://www.cnblogs.com/caijt/p/10739841.html
    /// 源地址：https://www.cnblogs.com/toiv/p/9379249.html
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class ApiGroupAttribute : Attribute, IApiDescriptionGroupNameProvider
    {
        /// <summary>
        /// 分组名称，IApiDescriptionGroupNameProvider 接口属性
        /// </summary>
        public string GroupName { get; set; }

        public ApiGroupAttribute(GroupNameEnum name)
        {
            GroupName = Enum.GetName(typeof(GroupNameEnum), name);
        }
    }
}
