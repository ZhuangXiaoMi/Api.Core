using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_Dept")]
    [Display(Name = "部门表")]
    public partial class SysDept : ABTEntity<SysDept>, ICreateEntity, IModifyEntity, IDeleteEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }
        //public int DeptId { get; set; }

        /// <summary>
        /// 上级部门Id
        /// </summary>
        [Display(Name = "上级部门Id")]
        public int ParentId { get; set; }

        /// <summary>
        /// 部门编码
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "部门编码")]
        public string DeptCode { get; set; }

        /// <summary>
        /// 部门名称
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "部门名称")]
        public string DeptName { get; set; }

        /// <summary>
        /// 简称
        /// </summary>
        [Display(Name = "简称")]
        public string SimpleName { get; set; }

        /// <summary>
        /// 机构类型：1：公司；2：部门；3：小组；
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Range(1, 3, ErrorMessage = "异常值")]
        [Display(Name = "机构类型", Description = "1：公司；2：部门；3：小组；")]
        public int DeptType { get; set; }

        /// <summary>
        /// 机构等级：1：一级；2：二级；3：三级；4：四级；
        /// </summary>
        [Range(1, 4, ErrorMessage = "异常值")]
        [Display(Name = "机构等级", Description = "1：一级；2：二级；3：三级；4：四级；")]
        public int Level { get; set; }

        /// <summary>
        /// 当前层级顺序，升序
        /// </summary>
        [Display(Name = "当前层级顺序", Description = "升序")]
        public int Seq { get; set; }

        /// <summary>
        /// 所属地区Id
        /// </summary>
        [Display(Name = "所属地区Id")]
        public int AreaId { get; set; }

        /// <summary>
        /// 负责人Id
        /// </summary>
        [Display(Name = "负责人Id")]
        public int LeaderId { get; set; }

        /// <summary>
        /// 联系地址
        /// </summary>
        [Display(Name = "联系地址")]
        public string Address { get; set; }

        /// <summary>
        /// 固定电话
        /// </summary>
        [Display(Name = "固定电话")]
        public string Telephone { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        //[EmailAddress(ErrorMessage = "邮箱格式不正确")]
        [DataType(DataType.EmailAddress, ErrorMessage = "邮箱格式不正确")]
        [Display(Name = "邮箱")]
        public string Email { get; set; }

        /// <summary>
        /// 是否允许编辑：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否允许编辑", Description = "0：否；1：是；")]
        public bool IsAllowEdit { get; set; }

        /// <summary>
        /// 是否允许删除：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否允许删除", Description = "0：否；1：是；")]
        public bool IsAllowDelete { get; set; }

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
