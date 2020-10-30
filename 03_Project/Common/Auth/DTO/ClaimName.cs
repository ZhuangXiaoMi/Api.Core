using System;

namespace Common
{
    [Serializable]
    public class ClaimName
    {
        /// <summary>
        /// 用户id
        /// </summary>
        public long user_id { get; set; }

        /// <summary>
        /// 登录账号
        /// </summary>
        public string account { get; set; }

        /// <summary>
        /// 过期时间
        /// </summary>
        public DateTime exp { get; set; }
    }
}
