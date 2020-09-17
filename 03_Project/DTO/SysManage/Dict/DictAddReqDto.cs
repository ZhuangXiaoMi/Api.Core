using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class DictAddReqDto
    {
        /// <summary>
        /// 上级Id
        /// </summary>
        [Description("上级Id")]
        [Display(Name = "上级Id")]
        public long? parent_id { get; set; }

        /// <summary>
        /// 族谱ids
        /// </summary>
        [Description("族谱ids")]
        [Display(Name = "族谱ids")]
        public string parent_ids { get; set; }

        /// <summary>
        /// 名称
        /// </summary>
        [Description("名称")]
        [Display(Name = "名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string name { get; set; }

        /// <summary>
        /// 值
        /// </summary>
        [Description("值")]
        [Display(Name = "值")]
        [Required(ErrorMessage = "{0}必填")]
        public string value { get; set; }

        /// <summary>
        /// 类型
        /// </summary>
        [Description("类型")]
        [Display(Name = "类型")]
        [Required(ErrorMessage = "{0}必填")]
        public string type { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        [Display(Name = "排序")]
        public int? sort { get; set; }

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
