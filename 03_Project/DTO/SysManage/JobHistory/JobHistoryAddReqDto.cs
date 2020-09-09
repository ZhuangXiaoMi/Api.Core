using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class JobHistoryAddReqDto
    {
        /// <summary>
        /// 用户Id
        /// </summary>
        [Description("用户Id")]
        [Display(Name = "用户Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long user_id { get; set; }

        /// <summary>
        /// 岗位Id
        /// </summary>
        [Description("岗位Id")]
        [Display(Name = "岗位Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long job_id { get; set; }

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
