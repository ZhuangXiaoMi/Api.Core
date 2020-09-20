using System.ComponentModel;

namespace Entity
{
    public enum Gender
    {
        /// <summary>
        /// 保密
        /// </summary>
        [Description("保密")]
        Secrecy = 0,

        /// <summary>
        /// 男
        /// </summary>
        [Description("男")]
        Gentleman = 1,

        /// <summary>
        /// 女
        /// </summary>
        [Description("女")]
        Lady = 2,
    }
}
