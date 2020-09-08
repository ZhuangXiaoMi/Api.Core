using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class AttachmentAddReqDto
    {
        /// <summary>
        /// 类型
        /// </summary>
        [Description("类型")]
        [Display(Name = "类型")]
        public string atta_type { get; set; }

        /// <summary>
        /// 对象Id
        /// </summary>
        [Description("对象Id")]
        [Display(Name = "对象Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long object_id { get; set; }

        /// <summary>
        /// 文件路径
        /// </summary>
        [Description("文件路径")]
        [Display(Name = "文件路径")]
        [Required(ErrorMessage = "{0}必填")]
        public string file_path { get; set; }

        /// <summary>
        /// 文件路径前缀
        /// </summary>
        [Description("文件路径前缀")]
        [Display(Name = "文件路径前缀")]
        public string prefix_path { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [Description("文件名称")]
        [Display(Name = "文件名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string file_name { get; set; }

        /// <summary>
        /// 文件类型
        /// </summary>
        [Description("文件类型")]
        [Display(Name = "文件类型")]
        [Required(ErrorMessage = "{0}必填")]
        public string file_type { get; set; }

        /// <summary>
        /// 文件大小：MB
        /// </summary>
        [Description("文件大小")]
        [Display(Name = "文件大小", Description = "MB")]
        public double? file_size { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        [Display(Name = "排序")]
        public int? sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        [Display(Name = "描述")]
        [StringLength(300, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Description("备注")]
        [Display(Name = "备注")]
        [StringLength(500, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string remark { get; set; }
    }
}
