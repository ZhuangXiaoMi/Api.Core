using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class UserModel
    {
        #region 原始字段
        /// <summary>
        /// 帐号
        /// </summary>
        [Description("帐号")]
        public string account { get; set; }

        ///// <summary>
        ///// 密码
        ///// </summary>
        //[Description("密码")]
        //public string password { get; set; }

        /// <summary>
        /// 用户密钥
        /// </summary>
        [Description("用户密钥")]
        public string secret_key { get; set; }

        /// <summary>
        /// 工号
        /// </summary>
        [Description("工号")]
        public string no { get; set; }

        /// <summary>
        /// 真实姓名
        /// </summary>
        [Description("真实姓名")]
        public string real_name { get; set; }

        /// <summary>
        /// 昵称
        /// </summary>
        [Description("昵称")]
        public string nickname { get; set; }

        /// <summary>
        /// 性别：0保密 1男 2女
        /// </summary>
        [Description("性别")]
        public int sex { get; set; }

        /// <summary>
        /// 年龄
        /// </summary>
        [Description("年龄")]
        public int age { get; set; }

        /// <summary>
        /// 生日
        /// </summary>
        [Description("生日")]
        public DateTime birthday { get; set; }

        /// <summary>
        /// 固定电话
        /// </summary>
        [Description("固定电话")]
        public string telephone { get; set; }

        /// <summary>
        /// 手机号码
        /// </summary>
        [Description("手机号码")]
        public string cellphone { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        [Description("邮箱")]
        public string email { get; set; }

        /// <summary>
        /// 微信
        /// </summary>
        [Description("微信")]
        public string wechat { get; set; }

        /// <summary>
        /// 学历：0无 1小学 2初中 3高中 4大专 5本科 6研究生 7博士生 8博士后
        /// </summary>
        [Description("学历")]
        public int education { get; set; }

        /// <summary>
        /// 头像
        /// </summary>
        [Description("头像")]
        public string icon { get; set; }

        /// <summary>
        /// 地址
        /// </summary>
        [Description("地址")]
        public string address { get; set; }

        /// <summary>
        /// 入职时间
        /// </summary>
        [Description("入职时间")]
        public DateTime entry_time { get; set; }

        /// <summary>
        /// 薪资
        /// </summary>
        [Description("薪资")]
        public decimal salary { get; set; }

        /// <summary>
        /// 系统样式
        /// </summary>
        [Description("系统样式")]
        public string theme { get; set; }

        /// <summary>
        /// 状态：0锁定 1正常 2未通过邮件验证 3未通过管理员验证 4删除
        /// </summary>
        [Description("状态")]
        public int status { get; set; }

        /// <summary>
        /// 部门Id
        /// </summary>
        [Description("部门Id")]
        public long dept_id { get; set; }

        /// <summary>
        /// 岗位Id
        /// </summary>
        [Description("岗位Id")]
        public long job_id { get; set; }

        /// <summary>
        /// 主管Id
        /// </summary>
        [Description("主管Id")]
        public long manager_id { get; set; }

        /// <summary>
        /// 安全级别
        /// </summary>
        [Description("安全级别")]
        public int security_level { get; set; }

        /// <summary>
        /// 上次登录IP
        /// </summary>
        [Description("上次登录IP")]
        public string last_login_ip { get; set; }

        /// <summary>
        /// 上次登录时间
        /// </summary>
        [Description("上次登录时间")]
        public DateTime last_login_time { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        public int sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        public string description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Description("备注")]
        public string remark { get; set; }

        /// <summary>
        /// 是否管理员：0否 1是
        /// </summary>
        [Description("是否管理员")]
        public int is_admin { get; set; }

        /// <summary>
        /// 是否启用：0否 1是
        /// </summary>
        [Description("是否启用")]
        public int is_enabled { get; set; }
        #endregion 原始字段

        #region 扩展字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Description("主键Id")]
        public long id { get; set; }

        /// <summary>
        /// 是否删除：0否 1是
        /// </summary>
        [Description("是否删除")]
        public int is_delete { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        [Description("创建用户Id")]
        public long create_user_id { get; set; }

        /// <summary>
        /// 修改用户Id
        /// </summary>
        [Description("修改用户Id")]
        public long modify_user_id { get; set; }

        /// <summary>
        /// 删除用户Id
        /// </summary>
        [Description("删除用户Id")]
        public long delete_user_id { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Description("创建时间")]
        public DateTime create_time { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Description("修改时间")]
        public DateTime modify_time { get; set; }

        /// <summary>
        /// 删除时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Description("删除时间")]
        public DateTime delete_time { get; set; }

        #endregion 扩展字段
    }
}
