using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class ModuleFormAddReqDto
    {
        /// <summary>
        /// 菜单Id
        /// </summary>
        [Description("菜单Id")]
        [Display(Name = "菜单Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long menu_id { get; set; }

        /// <summary>
        /// 模块表单编码
        /// </summary>
        [Description("模块表单编码")]
        [Display(Name = "模块表单编码")]
        [Required(ErrorMessage = "{0}必填")]
        public string module_form_code { get; set; }

        /// <summary>
        /// 模块表单名称
        /// </summary>
        [Description("模块表单名称")]
        [Display(Name = "模块表单名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string module_form_name { get; set; }

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
