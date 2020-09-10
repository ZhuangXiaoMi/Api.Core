using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class LogAddReqDto
    {
        /// <summary>
        /// 日志类型：1FATAL 2ERROR 3WARN 4INFO 5DEBUG
        /// </summary>
        [Description("日志类型")]
        [Display(Name = "日志类型", Description = "1FATAL 2ERROR 3WARN 4INFO 5DEBUG")]
        [Required(ErrorMessage = "{0}必填")]
        [Range(1, 5, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int log_type { get; set; }

        /// <summary>
        /// 操作IP
        /// </summary>
        [Description("操作IP")]
        [Display(Name = "操作IP")]
        public string ip { get; set; }

        /// <summary>
        /// 系统模块Id
        /// </summary>
        [Description("系统模块Id")]
        [Display(Name = "系统模块Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long module_id { get; set; }

        /// <summary>
        /// 系统模块名称
        /// </summary>
        [Description("系统模块名称")]
        [Display(Name = "系统模块名称")]
        public string module_name { get; set; }

        /// <summary>
        /// 请求地址
        /// </summary>
        [Description("请求地址")]
        [Display(Name = "请求地址")]
        [Required(ErrorMessage = "{0}必填")]
        [DataType(DataType.Url)]
        public string request_url { get; set; }

        /// <summary>
        /// 操作方式
        /// </summary>
        [Description("操作方式")]
        [Display(Name = "操作方式")]
        public string method { get; set; }

        /// <summary>
        /// 操作提交数据
        /// </summary>
        [Description("操作提交数据")]
        [Display(Name = "操作提交数据")]
        public string parameter { get; set; }

        /// <summary>
        /// 是否成功：0否 1是
        /// </summary>
        [Description("是否成功")]
        [Display(Name = "是否成功")]
        public int? is_success { get; set; }

        /// <summary>
        /// 异常信息
        /// </summary>
        [Description("异常信息")]
        [Display(Name = "异常信息")]
        [StringLength(500, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string exception { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        [Display(Name = "描述")]
        [StringLength(300, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string description { get; set; }
    }
}
