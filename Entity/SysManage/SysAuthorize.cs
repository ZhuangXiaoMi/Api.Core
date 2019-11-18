using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_Authorize")]
    [Display(Name = "授权表")]
    public partial class SysAuthorize : ABTEntity<SysAuthorize>, ICreateEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }

        /// <summary>
        /// 项目类型：1：菜单 SysMenu；2：页面元素 SysElement；3：操作按钮 SysOperateBtn；4：附件 SysAttachment；5：模块表单 SysModuleForm；
        /// </summary>
        [Range(1, 5, ErrorMessage = "异常值")]
        [Display(Name = "项目类型", Description = "1：菜单 SysMenu；2：页面元素 SysElement；3：操作按钮 SysOperateBtn；4：附件 SysAttachment；5：模块表单 SysModuleForm；")]
        public int ItemType { get; set; }

        /// <summary>
        /// 项目外键
        /// </summary>
        [Display(Name = "项目外键")]
        public int ItemId { get; set; }

        /// <summary>
        /// 对象类型：1：角色；2：用户；3：用户组；
        /// </summary>
        [Range(1, 3, ErrorMessage = "异常值")]
        [Display(Name = "对象类型", Description = "1：角色；2：用户；3：用户组；")]
        public int ObjectType { get; set; }

        /// <summary>
        /// 对象外键
        /// </summary>
        [Display(Name = "对象外键")]
        public int ObjectId { get; set; }

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
