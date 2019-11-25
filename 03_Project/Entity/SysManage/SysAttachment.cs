using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_Attachment")]
    [Display(Name = "附件表")]
    public partial class SysAttachment : ABTEntity<SysAttachment>, ICreateEntity, IDeleteEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }
        //public int AttaId { get; set; }

        /// <summary>
        /// 类型
        /// </summary>
        [Display(Name = "类型")]
        public string AttaType { get; set; }

        /// <summary>
        /// 对象Id
        /// </summary>
        [Display(Name = "对象Id")]
        public int ObjectId { get; set; }

        /// <summary>
        /// 文件路径
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "文件路径")]
        public string FilePath { get; set; }

        /// <summary>
        /// 文件路径前缀
        /// </summary>
        [NotMapped]
        [Display(Name = "文件路径前缀")]
        public string PrefixPath { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "文件名称")]
        public string FileName { get; set; }

        /// <summary>
        /// 文件类型
        /// </summary>
        [Display(Name = "文件类型")]
        public string FileType { get; set; }

        /// <summary>
        /// 文件大小：MB
        /// </summary>
        [Display(Name = "文件大小", Description = "MB")]
        public double FileSize { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Display(Name = "排序", Description = "升序")]
        public int Sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [StringLength(500, ErrorMessage = "少于{0}个字")]
        [Display(Name = "描述")]
        public string Description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Display(Name = "备注")]
        public string Remark { get; set; }

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
