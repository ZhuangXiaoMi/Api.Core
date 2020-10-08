using System.ComponentModel;

namespace DTO
{
    public enum AccountStatusEnum
    {
        /// <summary>
        /// 锁定
        /// </summary>
        [Description("锁定")]
        LOCK = 0,

        /// <summary>
        /// 正常
        /// </summary>
        [Description("正常")]
        NORMAL = 1,

        /// <summary>
        /// 未通过邮件验证
        /// </summary>
        [Description("未通过邮件验证")]
        NO_MAIL_VERIFY = 2,

        /// <summary>
        /// 未通过管理员验证
        /// </summary>
        [Description("未通过管理员验证")]
        NO_ADMIN_VERIFY = 3,

        /// <summary>
        /// 删除
        /// </summary>
        [Description("删除")]
        DELETE = 4,
    }
}
