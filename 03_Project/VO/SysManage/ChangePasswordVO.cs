﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VO.SysManage
{
    [NotMapped]
    public partial class ChangePasswordVO
    {
        /// <summary>
        /// 原密码
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "密码")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "{2}到{1}个字符")]
        [DataType(DataType.Password)]
        public string OriginalPassword { get; set; }

        /// <summary>
        /// 新密码
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "新密码")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "{2}到{1}个字符")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        /// <summary>
        /// 确认密码
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Compare("Password", ErrorMessage = "两次输入的密码不一致")]
        [DataType(DataType.Password)]
        [Display(Name = "确认密码")]
        public string ConfirmPassword { get; set; }
    }
}
