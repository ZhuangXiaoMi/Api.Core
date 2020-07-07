using MessagePack;

namespace Common
{
    [MessagePackObject(keyAsPropertyName: true)]
    public class ConnectionModel
    {
        /// <summary>
        /// 用户Id
        /// </summary>
        public string UserId { set; get; }

        /// <summary>
        /// 连接Id
        /// </summary>
        public string ConnectionId { set; get; }

        /// <summary>
        /// 是否排除指定连接，当且仅当 UserId 有值的情况才有效
        /// </summary>
        public bool ExcludeConnectId { set; get; }

        /// <summary>
        /// 通知数据
        /// </summary>
        public dynamic NotifyData { set; get; }
    }
}
