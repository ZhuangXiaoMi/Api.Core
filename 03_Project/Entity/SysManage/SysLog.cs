using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 日志表
    /// </summary>
    [Table("sys_log")]
    public partial class SysLog : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 日志类型：1FATAL 2ERROR 3WARN 4INFO 5DEBUG
        /// </summary>
        [Description("日志类型")]
        public int log_type { get; set; }

        /// <summary>
        /// 操作IP
        /// </summary>
        [Description("操作IP")]
        public string ip { get; set; }

        /// <summary>
        /// 系统模块Id
        /// </summary>
        [Description("系统模块Id")]
        public long module_id { get; set; }

        /// <summary>
        /// 系统模块名称
        /// </summary>
        [Description("系统模块名称")]
        public string module_name { get; set; }

        /// <summary>
        /// 请求地址
        /// </summary>
        [Description("请求地址")]
        public string request_url { get; set; }

        /// <summary>
        /// 操作方式
        /// </summary>
        [Description("操作方式")]
        public string method { get; set; }

        /// <summary>
        /// 操作提交数据
        /// </summary>
        [Description("操作提交数据")]
        public string parameter { get; set; }

        /// <summary>
        /// 是否成功：0否 1是
        /// </summary>
        [Description("是否成功")]
        public int is_success { get; set; }

        /// <summary>
        /// 异常信息
        /// </summary>
        [Description("异常信息")]
        public string exception { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        public string description { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
