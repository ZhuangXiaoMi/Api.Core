using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class MenuAddReqDto
    {
        /// <summary>
        /// 上级菜单Id
        /// </summary>
        [Description("上级菜单Id")]
        [Display(Name = "上级菜单Id")]
        public long? parent_id { get; set; }

        /// <summary>
        /// 族谱ids
        /// </summary>
        [Description("族谱ids")]
        [Display(Name = "族谱ids")]
        public string parent_ids { get; set; }

        /// <summary>
        /// 菜单编码
        /// </summary>
        [Description("菜单编码")]
        [Display(Name = "菜单编码")]
        [Required(ErrorMessage = "{0}必填")]
        public string menu_code { get; set; }

        /// <summary>
        /// 菜单名称
        /// </summary>
        [Description("菜单名称")]
        [Display(Name = "菜单名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string menu_name { get; set; }

        /// <summary>
        /// 菜单层次
        /// </summary>
        [Description("菜单层次")]
        [Display(Name = "菜单层次")]
        public int? level { get; set; }

        /// <summary>
        /// 链接
        /// </summary>
        [Description("链接")]
        [Display(Name = "链接")]
        //[Url]
        public string url { get; set; }

        /// <summary>
        /// 目标：mainFrame、_blank、_self、_parent、_top
        /// </summary>
        [Description("目标")]
        [Display(Name = "目标", Description = "mainFrame、_blank、_self、_parent、_top")]
        public string target { get; set; }

        /// <summary>
        /// 图标
        /// </summary>
        [Description("图标")]
        [Display(Name = "图标")]
        [FileExtensions(Extensions = "jpg,jpeg", ErrorMessage = "{0}格式不正确")]
        public string icon { get; set; }

        /// <summary>
        /// 是否菜单：0否 1是
        /// </summary>
        [Description("是否菜单")]
        [Display(Name = "是否菜单")]
        public int? is_menu { get; set; }

        /// <summary>
        /// 是否展开：0否 1是
        /// </summary>
        [Description("是否展开")]
        [Display(Name = "是否展开")]
        public int? is_expand { get; set; }

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

        /// <summary>
        /// 是否启用：0否 1是
        /// </summary>
        [Description("是否启用")]
        [Display(Name = "是否启用")]
        [Range(0, 1, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int? is_enabled { get; set; }
    }
}
