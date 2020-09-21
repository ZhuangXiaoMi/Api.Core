using System.ComponentModel;

namespace DTO
{
    /// <summary>
    /// 状态码定义
    /// </summary>
    public class DEFINE
    {
        /// <summary>
        /// 请求成功
        /// </summary>
        [Description("请求成功")]
        public const int SUCCESS = 200;

        /// <summary>
        /// 系统错误
        /// </summary>
        [Description("系统错误")]
        public const int FAIL = 10001;

        /// <summary>
        /// 未授权
        /// </summary>
        [Description("未授权")]
        public const int ERROR_UNAUTHORIZED = 401;

    }
}
