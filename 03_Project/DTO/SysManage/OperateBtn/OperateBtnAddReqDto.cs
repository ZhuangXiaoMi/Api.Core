using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class OperateBtnAddReqDto
    {
        /// <summary>
        /// 菜单Id
        /// </summary>
        [Description("菜单Id")]
        [Display(Name = "菜单Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long menu_id { get; set; }

        /// <summary>
        /// 操作按钮编码
        /// </summary>
        [Description("操作按钮编码")]
        [Display(Name = "操作按钮编码")]
        [Required(ErrorMessage = "{0}必填")]
        public string oper_btn_code { get; set; }

        /// <summary>
        /// 操作按钮名称
        /// </summary>
        [Description("操作按钮名称")]
        [Display(Name = "操作按钮名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string oper_btn_name { get; set; }

        /// <summary>
        /// 事件
        /// </summary>
        [Description("事件")]
        [Display(Name = "事件")]
        public string btn_event { get; set; }

        /// <summary>
        /// 链接
        /// </summary>
        [Description("链接")]
        [Display(Name = "链接")]
        //[Url]
        public string url { get; set; }

        /// <summary>
        /// 图标
        /// </summary>
        [Description("图标")]
        [Display(Name = "图标")]
        [FileExtensions(Extensions = "jpg,jpeg", ErrorMessage = "{0}格式不正确")]
        public string icon { get; set; }

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
