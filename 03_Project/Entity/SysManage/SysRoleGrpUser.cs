using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_RoleGrpUser")]
    [Display(Name = "角色与用户组关联表")]
    public partial class SysRoleGrpUser : ABTEntity<SysRoleGrpUser>, ICreateEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }

        /// <summary>
        /// 角色Id
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "角色Id")]
        public int RoleId { get; set; }

        /// <summary>
        /// 用户组Id
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "用户组Id")]
        public int GrpUserId { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Display(Name = "备注")]
        public string Remark { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        [Display(Name = "创建用户Id")]
        public int CreateUserId { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "创建时间")]
        public DateTime CreateTime { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
