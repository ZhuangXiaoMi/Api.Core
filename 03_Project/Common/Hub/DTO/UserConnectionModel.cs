using System;

namespace Common
{
    [Serializable]
    public class UserConnectionModel
    {
        /// <summary>
        /// 用户Id
        /// </summary>
        public string UserId { set; get; }

        /// <summary>
        /// 连接Id
        /// </summary>
        public string ConnectionId { set; get; }
    }
}
