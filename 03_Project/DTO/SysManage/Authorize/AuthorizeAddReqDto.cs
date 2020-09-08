using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class AuthorizeAddReqDto
    {
        /// <summary>
        /// 项目类型：1菜单SysMenu 2页面元素SysElement 3操作按钮SysOperateBtn 4附件SysAttachment 5模块表单SysModuleForm
        /// </summary>
        [Description("项目类型")]
        [Display(Name = "项目类型", Description = "1菜单SysMenu 2页面元素SysElement 3操作按钮SysOperateBtn 4附件SysAttachment 5模块表单SysModuleForm")]
        [Required(ErrorMessage = "{0}必填")]
        [Range(1, 5, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int item_type { get; set; }

        /// <summary>
        /// 项目外键
        /// </summary>
        [Description("项目外键")]
        [Display(Name = "项目外键")]
        [Required(ErrorMessage = "{0}必填")]
        public long item_id { get; set; }

        /// <summary>
        /// 对象类型：1角色 2用户 3用户组
        /// </summary>
        [Description("对象类型")]
        [Display(Name = "对象类型", Description = "1角色 2用户 3用户组")]
        [Required(ErrorMessage = "{0}必填")]
        [Range(1, 3, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int object_type { get; set; }

        /// <summary>
        /// 对象外键
        /// </summary>
        [Description("对象外键")]
        [Display(Name = "对象外键")]
        [Required(ErrorMessage = "{0}必填")]
        public long object_id { get; set; }

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
