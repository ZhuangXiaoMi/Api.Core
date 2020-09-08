using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class DBBackupAddReqDto
    {
        /// <summary>
        /// 备份类型：1完全备份 2增量备份
        /// </summary>
        [Description("备份类型")]
        [Display(Name = "备份类型", Description = "1完全备份 2增量备份")]
        [Required(ErrorMessage = "{0}必填")]
        [Range(1, 2, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int backup_type { get; set; }

        /// <summary>
        /// 数据库名称
        /// </summary>
        [Description("数据库名称")]
        [Display(Name = "数据库名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string db_name { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [Description("文件名称")]
        [Display(Name = "文件名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string file_name { get; set; }

        /// <summary>
        /// 文件大小：MB
        /// </summary>
        [Description("文件大小")]
        [Display(Name = "文件大小", Description = "MB")]
        public double? file_size { get; set; }

        /// <summary>
        /// 文件路径
        /// </summary>
        [Description("文件路径")]
        [Display(Name = "文件路径")]
        [Required(ErrorMessage = "{0}必填")]
        public string file_path { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        [Display(Name = "描述")]
        [StringLength(300, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string description { get; set; }
    }
}
