using MessagePack;

namespace Common
{
    [MessagePackObject(keyAsPropertyName: true)]
    public class NotifyModel
    {
        /// <summary>
        /// 组名集合(多个以,隔开)
        /// </summary>
        public string GroupIds { set; get; }

        /// <summary>
        /// 用户Id列表(多个以,隔开)
        /// </summary>
        public string UserIds { set; get; }

        /// <summary>
        /// 是否排除指定用户列表
        /// </summary>
        public bool ExcludeUsers { set; get; }

        /// <summary>
        /// 通知数据
        /// </summary>
        public dynamic NotifyData { set; get; }
    }
}
