using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class UserAddReqDto
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
        [DataType(DataType.Password)]
        public string password { get; set; }

        /// <summary>
        /// 用户密钥
        /// </summary>
        [Description("用户密钥")]
        [Display(Name = "用户密钥")]
        [Required(ErrorMessage = "{0}必填")]
        public string secret_key { get; set; }

        /// <summary>
        /// 工号
        /// </summary>
        [Description("工号")]
        [Display(Name = "工号")]
        public string no { get; set; }

        /// <summary>
        /// 真实姓名
        /// </summary>
        [Description("真实姓名")]
        [Display(Name = "真实姓名")]
        public string real_name { get; set; }

        /// <summary>
        /// 昵称
        /// </summary>
        [Description("昵称")]
        [Display(Name = "昵称")]
        public string nickname { get; set; }

        /// <summary>
        /// 性别：0保密 1男 2女
        /// </summary>
        [Description("性别")]
        [Display(Name = "性别", Description = "0保密 1男 2女")]
        [Range(0, 2, ErrorMessage = "{0}格式不正确")]
        public int? sex { get; set; }

        /// <summary>
        /// 年龄
        /// </summary>
        [Description("年龄")]
        [Display(Name = "年龄")]
        [Range(1, 200, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public int? age { get; set; }

        /// <summary>
        /// 生日
        /// </summary>
        [Description("生日")]
        [Display(Name = "生日")]
        [DataType(DataType.DateTime)]
        [Range(typeof(DateTime), "1900-01-01", "2999-12-31", ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public DateTime? birthday { get; set; }

        /// <summary>
        /// 固定电话
        /// </summary>
        [Description("固定电话")]
        [Display(Name = "固定电话")]
        public string telephone { get; set; }

        /// <summary>
        /// 手机号码
        /// </summary>
        [Description("手机号码")]
        [Display(Name = "手机号码")]
        [Required(ErrorMessage = "{0}必填")]
        [Phone]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^1[3456789]\d{9}$", ErrorMessage = "{0}格式不正确")]
        public string cellphone { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        [Description("邮箱")]
        [Display(Name = "邮箱")]
        //[EmailAddress(ErrorMessage = "{0}格式不正确")]
        [Required(ErrorMessage = "{0}必填")]
        [DataType(DataType.EmailAddress, ErrorMessage = "{0}格式不正确")]
        public string email { get; set; }

        /// <summary>
        /// 微信
        /// </summary>
        [Description("微信")]
        [Display(Name = "微信")]
        public string wechat { get; set; }

        /// <summary>
        /// 学历：0无 1小学 2初中 3高中 4大专 5本科 6研究生 7博士生 8博士后
        /// </summary>
        [Description("学历")]
        [Display(Name = "学历", Description = "0无 1小学 2初中 3高中 4大专 5本科 6研究生 7博士生 8博士后")]
        [Range(0, 8, ErrorMessage = "{0}格式不正确")]
        public int? education { get; set; }

        /// <summary>
        /// 头像
        /// </summary>
        [Description("头像")]
        [Display(Name = "头像")]
        [FileExtensions(Extensions = "jpg,jpeg", ErrorMessage = "{0}格式不正确")]
        public string icon { get; set; }

        /// <summary>
        /// 地址
        /// </summary>
        [Description("地址")]
        [Display(Name = "地址")]
        [StringLength(80, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string address { get; set; }

        /// <summary>
        /// 入职时间
        /// </summary>
        [Description("入职时间")]
        [Display(Name = "入职时间")]
        [DataType(DataType.DateTime)]
        public DateTime? entry_time { get; set; }

        /// <summary>
        /// 薪资
        /// </summary>
        [Description("薪资")]
        [Display(Name = "薪资")]
        public decimal? salary { get; set; }

        /// <summary>
        /// 系统样式
        /// </summary>
        [Description("系统样式")]
        [Display(Name = "系统样式")]
        public string theme { get; set; }

        /// <summary>
        /// 状态：0锁定 1正常 2未通过邮件验证 3未通过管理员验证 4删除
        /// </summary>
        [Description("状态")]
        [Display(Name = "状态", Description = "0锁定 1正常 2未通过邮件验证 3未通过管理员验证 4删除")]
        [Required(ErrorMessage = "{0}必填")]
        [Range(0, 4, ErrorMessage = "{0}格式不正确")]
        public int? status { get; set; }

        /// <summary>
        /// 部门Id
        /// </summary>
        [Description("部门Id")]
        [Display(Name = "部门Id")]
        public long? dept_id { get; set; }

        /// <summary>
        /// 岗位Id
        /// </summary>
        [Description("岗位Id")]
        [Display(Name = "岗位Id")]
        public long? job_id { get; set; }

        /// <summary>
        /// 主管Id
        /// </summary>
        [Description("主管Id")]
        [Display(Name = "主管Id")]
        public long? manager_id { get; set; }

        /// <summary>
        /// 安全级别
        /// </summary>
        [Description("安全级别")]
        [Display(Name = "安全级别")]
        public int? security_level { get; set; }

        /// <summary>
        /// 上次登录IP
        /// </summary>
        [Description("上次登录IP")]
        [Display(Name = "上次登录IP")]
        public string last_login_ip { get; set; }

        /// <summary>
        /// 上次登录时间
        /// </summary>
        [Description("上次登录时间")]
        [Display(Name = "上次登录时间")]
        [DisplayFormat(DataFormatString = "{0:g}")]
        public DateTime? last_login_time { get; set; }

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
        /// 是否管理员：0否 1是
        /// </summary>
        [Description("是否管理员")]
        [Display(Name = "是否管理员")]
        public int? is_admin { get; set; }

        /// <summary>
        /// 是否启用：0否 1是
        /// </summary>
        [Description("是否启用")]
        [Display(Name = "是否启用")]
        [Range(0, 1, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int? is_enabled { get; set; }
    }
}
