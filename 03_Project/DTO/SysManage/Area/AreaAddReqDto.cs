using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class AreaAddReqDto
    {
        /// <summary>
        /// 上级地区Id
        /// </summary>
        [Description("上级地区Id")]
        [Display(Name = "上级地区Id")]
        public long? parent_id { get; set; }

        /// <summary>
        /// 族谱ids
        /// </summary>
        [Description("族谱ids")]
        [Display(Name = "族谱ids")]
        public string parent_ids { get; set; }

        /// <summary>
        /// 行政区划代码
        /// </summary>
        [Description("行政区划代码")]
        [Display(Name = "行政区划代码")]
        [RegularExpression(@"[1-9]\d{8}(?!\d)", ErrorMessage = "{0}格式不正确")]
        public string administrative_division { get; set; }

        /// <summary>
        /// 邮政编码
        /// </summary>
        [Description("邮政编码")]
        [Display(Name = "邮政编码")]
        [Required(ErrorMessage = "{0}必填")]
        [RegularExpression(@"[1-9]\d{5}(?!\d)", ErrorMessage = "{0}格式不正确")]
        [DataType(DataType.PostalCode)]
        public string area_code { get; set; }

        /// <summary>
        /// 地区名称
        /// </summary>
        [Description("地区名称")]
        [Display(Name = "地区名称")]
        [Required(ErrorMessage = "{0}必填")]
        [StringLength(20, MinimumLength = 1, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string area_name { get; set; }

        /// <summary>
        /// 简称
        /// </summary>
        [Description("简称")]
        [Display(Name = "简称")]
        [StringLength(20, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string simple_name { get; set; }

        /// <summary>
        /// 行政区划级别：0国家 1省级 2地级 3县级 4乡级 5村庄
        /// </summary>
        [Description("行政区划级别")]
        [Display(Name = "行政区划级别", Description = "0国家 1省级 2地级 3县级 4乡级 5村庄")]
        [Required(ErrorMessage = "{0}必填")]
        [Range(0, 5, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int level { get; set; }

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
