using System;

namespace Common
{
    /// <summary>
    /// 缓存特性验证，添加到要缓存数据的Service层方法中（必须是方法）
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, Inherited = true)]
    public class CachingAttribute : System.Attribute
    {
        /// <summary>
        /// 缓存绝对过期时间（分钟）
        /// </summary>
        public int AbsoluteExpiration { get; set; } = 30;
    }
}
