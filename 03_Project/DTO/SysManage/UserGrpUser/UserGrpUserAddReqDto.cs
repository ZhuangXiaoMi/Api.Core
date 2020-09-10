using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class UserGrpUserAddReqDto
    {
        /// <summary>
        /// 用户Id
        /// </summary>
        [Description("用户Id")]
        [Display(Name = "用户Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long user_id { get; set; }

        /// <summary>
        /// 用户组Id
        /// </summary>
        [Description("用户组Id")]
        [Display(Name = "用户组Id")]
        [Required(ErrorMessage = "{0}必填")]
        public long grp_user_id { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Description("备注")]
        [Display(Name = "备注")]
        [StringLength(500, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string remark { get; set; }
    }
}
