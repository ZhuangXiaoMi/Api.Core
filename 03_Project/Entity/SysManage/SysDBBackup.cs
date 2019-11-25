using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_DBBackup")]
    [Display(Name = "数据库备份表")]
    public partial class SysDBBackup : ABTEntity<SysDBBackup>, ICreateEntity, IDeleteEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }

        /// <summary>
        /// 备份类型：1：完全备份；2：增量备份；
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Range(1, 2, ErrorMessage = "异常值")]
        [Display(Name = "备份类型", Description = "1：完全备份；2：增量备份；")]
        public int BackupType { get; set; }

        /// <summary>
        /// 数据库名称
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "数据库名称")]
        public string DBName { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "文件名称")]
        public string FileName { get; set; }

        /// <summary>
        /// 文件大小
        /// </summary>
        [Display(Name = "文件大小", Description = "MB")]
        public double FileSize { get; set; }

        /// <summary>
        /// 文件路径
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "文件路径")]
        public string FilePath { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [StringLength(500, ErrorMessage = "少于{0}个字")]
        [Display(Name = "描述")]
        public string Description { get; set; }

        /// <summary>
        /// 是否删除：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否删除", Description = "0：否；1：是；")]
        public bool IsDelete { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        [Display(Name = "创建用户Id")]
        public int CreateUserId { get; set; }

        /// <summary>
        /// 删除用户Id
        /// </summary>
        [Display(Name = "删除用户Id")]
        public int? DeleteUserId { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "创建时间")]
        public DateTime CreateTime { get; set; }

        /// <summary>
        /// 删除时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "删除时间")]
        public DateTime? DeleteTime { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
