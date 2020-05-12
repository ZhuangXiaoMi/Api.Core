using Entity.BaseManage;
using Entity.Enum;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_User")]
    [Display(Name = "用户表")]
    public partial class SysUser : ABTEntity<SysUser>, ICreateEntity, IModifyEntity, IDeleteEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }
        //public int UserId { get; set; }

        /// <summary>
        /// 帐号
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [StringLength(24, MinimumLength = 4, ErrorMessage = "{1}到{0}个字")]
        [Display(Name = "帐号")]
        public string Account { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [DataType(DataType.Password)]
        [Display(Name = "密码")]
        public string Password { get; set; }

        /// <summary>
        /// 用户密钥
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "用户密钥")]
        public string SecretKey { get; set; }

        /// <summary>
        /// 工号
        /// </summary>
        [Display(Name = "工号")]
        public string No { get; set; }

        /// <summary>
        /// 真实姓名
        /// </summary>
        [Display(Name = "真实姓名")]
        public string RealName { get; set; }

        /// <summary>
        /// 昵称
        /// </summary>
        [Display(Name = "昵称")]
        public string Nickname { get; set; }

        /// <summary>
        /// 性别：0：保密；1：男；2：女；
        /// </summary>
        [Range(0, 2, ErrorMessage = "异常值")]
        [Display(Name = "性别", Description = "0：保密；1：男；2：女；")]
        public Gender Sex { get; set; }

        /// <summary>
        /// 年龄
        /// </summary>
        [Range(1, 200, ErrorMessage = "取值范围{0}-{1}岁")]
        [Display(Name = "年龄")]
        public int Age { get; set; }

        /// <summary>
        /// 生日
        /// </summary>
        [DataType(DataType.DateTime)]
        [Range(typeof(DateTime), "1900-01-01", "2099-12-31", ErrorMessage = "日期范围{0}-{1}")]
        [Display(Name = "生日")]
        public DateTime? Birthday { get; set; }

        /// <summary>
        /// 固定电话
        /// </summary>
        [Display(Name = "固定电话")]
        public string Telephone { get; set; }

        /// <summary>
        /// 手机号码
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Phone]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^1[3456789]\d{9}$", ErrorMessage = "错误")]
        [Display(Name = "手机号码")]
        public string Cellphone { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        //[EmailAddress(ErrorMessage = "邮箱格式不正确")]
        [Required(ErrorMessage = "必填")]
        [DataType(DataType.EmailAddress, ErrorMessage = "邮箱格式不正确")]
        [Display(Name = "邮箱")]
        public string Email { get; set; }

        /// <summary>
        /// 微信
        /// </summary>
        [Display(Name = "微信")]
        public string WeChat { get; set; }

        /// <summary>
        /// 学历：0：无；1：小学；2：初中；3：高中；4：大专；5：本科；6：研究生；7：博士生；8：博士后；
        /// </summary>
        [Range(0, 8, ErrorMessage = "异常值")]
        [Display(Name = "学历", Description = "0：无；1：小学；2：初中；3：高中；4：大专；5：本科；6：研究生；7：博士生；8：博士后；")]
        public int Education { get; set; }

        /// <summary>
        /// 头像
        /// </summary>
        [FileExtensions(Extensions = "jpg,jpeg", ErrorMessage = "扩展名必须为{0}")]
        [Display(Name = "头像")]
        public string Icon { get; set; }

        /// <summary>
        /// 地址
        /// </summary>
        [StringLength(80, ErrorMessage = "少于{0}个字")]
        [Display(Name = "地址")]
        public string Address { get; set; }

        /// <summary>
        /// 入职时间
        /// </summary>
        [DataType(DataType.DateTime)]
        [Display(Name = "入职时间")]
        public DateTime? EntryTime { get; set; }

        /// <summary>
        /// 薪资
        /// </summary>
        [Display(Name = "薪资")]
        public double? Salary { get; set; }

        /// <summary>
        /// 系统样式
        /// </summary>
        [Display(Name = "系统样式")]
        public string Theme { get; set; }

        /// <summary>
        /// 状态：0：锁定；1：正常；2：未通过邮件验证；3：未通过管理员验证；4：删除；
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Range(0, 4, ErrorMessage = "异常值")]
        [Display(Name = "状态", Description = "0：锁定；1：正常；2：未通过邮件验证；3：未通过管理员验证；4：删除；")]
        public int Status { get; set; }

        /// <summary>
        /// 部门Id
        /// </summary>
        [Display(Name = "部门Id")]
        public int DeptId { get; set; }

        /// <summary>
        /// 岗位Id
        /// </summary>
        [Display(Name = "岗位Id")]
        public int JobId { get; set; }

        /// <summary>
        /// 主管Id
        /// </summary>
        [Display(Name = "主管Id")]
        public int ManagerId { get; set; }

        /// <summary>
        /// 安全级别
        /// </summary>
        [Display(Name = "安全级别")]
        public int SecurityLevel { get; set; }

        /// <summary>
        /// 上次登录IP
        /// </summary>
        [Display(Name = "上次登录IP")]
        public string LastLoginIP { get; set; }

        /// <summary>
        /// 上次登录时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "上次登录时间")]
        public DateTime? LastLoginTime { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Display(Name = "排序", Description = "升序")]
        public int Sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [StringLength(500, ErrorMessage = "少于{0}个字")]
        [Display(Name = "描述")]
        public string Description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Display(Name = "备注")]
        public string Remark { get; set; }

        /// <summary>
        /// 是否管理员：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否管理员", Description = "0：否；1：是；")]
        public bool IsAdministrator { get; set; }

        /// <summary>
        /// 是否启用：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否启用", Description = "0：否；1：是；")]
        public bool IsEnabled { get; set; }

        /// <summary>
        /// 是否删除：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否删除", Description = "0：否；1：是；")]
        public bool IsDelete { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        [Display(Name = "创建用户Id")]
        public int CreateUserId { get; set; }

        /// <summary>
        /// 修改用户Id
        /// </summary>
        [Display(Name = "修改用户Id")]
        public int? ModifyUserId { get; set; }

        /// <summary>
        /// 删除用户Id
        /// </summary>
        [Display(Name = "删除用户Id")]
        public int? DeleteUserId { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "创建时间")]
        public DateTime CreateTime { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "修改时间")]
        public DateTime? ModifyTime { get; set; }

        /// <summary>
        /// 删除时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "删除时间")]
        public DateTime? DeleteTime { get; set; }
        #endregion 原始字段

        #region 扩展字段
        /// <summary>
        /// 行版本(时间戳处理并发)
        /// </summary>
        //[Timestamp]
        //public byte[] RowVersion { get; set; }

        /// <summary>
        /// 角色实体(导航属性)
        /// </summary>
        //public SysRole Role { get; set; }
        #endregion 扩展字段
    }
}
