using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_Area")]
    [Display(Name = "地区表")]
    public partial class SysArea : ABTEntity<SysArea>, ICreateEntity, IModifyEntity, IDeleteEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }
        //public int AreaId { get; set; }

        /// <summary>
        /// 上级地区Id
        /// </summary>
        [Display(Name = "上级地区Id")]
        public int ParentId { get; set; }

        /// <summary>
        /// 行政区划代码
        /// </summary>
        [StringLength(9, ErrorMessage = "少于{0}位数")]
        [RegularExpression(@"[1-9]\d{8}(?!\d)", ErrorMessage = "异常值")]
        [Display(Name = "行政区划代码")]
        public string AdministrativeDivision { get; set; }

        /// <summary>
        /// 邮政编码
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [StringLength(6, ErrorMessage = "少于{0}位数")]
        [RegularExpression(@"[1-9]\d{5}(?!\d)", ErrorMessage = "异常值")]
        [DataType(DataType.PostalCode)]
        [Display(Name = "邮政编码")]
        public string AreaCode { get; set; }

        /// <summary>
        /// 地区名称
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "地区名称")]
        public string AreaName { get; set; }

        /// <summary>
        /// 简称
        /// </summary>
        [Display(Name = "简称")]
        public string SimpleName { get; set; }

        /// <summary>
        /// 行政区划级别：0：国家；1：省级；2：地级；3：县级；4：乡级；
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Range(0, 4, ErrorMessage = "异常值")]
        [Display(Name = "行政区划级别", Description = "0：国家；1：省级；2：地级；3：县级；4：乡级；")]
        public int Level { get; set; }

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
        /// 是否启用：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否启用", Description = "0：否；1：是；")]
        public bool IsEnabled { get; set; }

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
        /// 修改用户Id
        /// </summary>
        [Display(Name = "修改用户Id")]
        public int? ModifyUserId { get; set; }

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
        /// 修改时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "修改时间")]
        public DateTime? ModifyTime { get; set; }

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
