using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class JobAddReqDto
    {
        /// <summary>
        /// 岗位名称
        /// </summary>
        [Description("岗位名称")]
        [Display(Name = "岗位名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string job_name { get; set; }

        /// <summary>
        /// 昵称
        /// </summary>
        [Description("昵称")]
        [Display(Name = "昵称")]
        public string nickname { get; set; }

        /// <summary>
        /// 部门Id
        /// </summary>
        [Description("部门Id")]
        [Display(Name = "部门Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long dept_id { get; set; }

        /// <summary>
        /// 最低薪资
        /// </summary>
        [Description("最低薪资")]
        [Display(Name = "最低薪资")]
        public decimal? min_salary { get; set; }

        /// <summary>
        /// 最高薪资
        /// </summary>
        [Description("最高薪资")]
        [Display(Name = "最高薪资")]
        public decimal? max_salary { get; set; }

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
