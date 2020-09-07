using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    /// <summary>
    /// 附件表
    /// </summary>
    [Table("Sys_Attachment")]
    public partial class SysAttachment : ABTAggregateRoot<SysAttachment>
    {
        #region 原始字段
        /// <summary>
        /// 类型
        /// </summary>
        [Display(Name = "类型")]
        public string atta_type { get; set; }

        /// <summary>
        /// 对象Id
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "对象Id")]
        public long object_id { get; set; }

        /// <summary>
        /// 文件路径
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "文件路径")]
        public string file_path { get; set; }

        /// <summary>
        /// 文件路径前缀
        /// </summary>
        [NotMapped]
        [Display(Name = "文件路径前缀")]
        public string prefix_path { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "文件名称")]
        public string file_name { get; set; }

        /// <summary>
        /// 文件类型
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "文件类型")]
        public string file_type { get; set; }

        /// <summary>
        /// 文件大小：MB
        /// </summary>
        [Display(Name = "文件大小", Description = "MB")]
        public double file_size { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Display(Name = "排序", Description = "升序")]
        public int sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [StringLength(500, ErrorMessage = "少于{0}个字")]
        [Display(Name = "描述")]
        public string description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Display(Name = "备注")]
        public string remark { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
