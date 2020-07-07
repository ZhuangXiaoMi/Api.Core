using System;
using System.ComponentModel;

namespace Common
{
    public class LogInfoModel
    {
        /// <summary>
        /// 对象
        /// </summary>
        [Description("对象")]
        public string Object { get; set; }

        /// <summary>
        /// 时间
        /// </summary>
        [Description("时间")]
        public DateTime Time { get; set; }

        /// <summary>
        /// 内容
        /// </summary>
        [Description("内容")]
        public string Content { get; set; }

        /// <summary>
        /// IP
        /// </summary>
        [Description("IP")]
        public string IP { get; set; }
    }
}
