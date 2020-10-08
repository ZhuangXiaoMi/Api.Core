using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    public class LoginReqDto
    {
        /// <summary>
        /// 帐号
        /// </summary>
        [Description("帐号")]
        [Display(Name = "帐号")]
        [Required(ErrorMessage = "{0}必填")]
        [StringLength(24, MinimumLength = 2, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string account { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        [Description("密码")]
        [Display(Name = "密码")]
        [Required(ErrorMessage = "{0}必填")]
        public string password { get; set; }
    }
}
