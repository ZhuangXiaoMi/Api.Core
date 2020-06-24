using System.Threading.Tasks;

namespace Common
{
    /// <summary>
    /// 客户端使用接口
    /// </summary>
    public interface IChatClient
    {
        /// <summary>
        /// 上线通知（只有用户的第一个连接才通知）
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        Task OnLineAsync(dynamic data);

        /// <summary>
        /// 下线通知（只有当用户一个连接都没了才算下线）
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        Task OffLineAsync(dynamic data);

        /// <summary>
        /// 通知
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        Task OnNotifyAsync(dynamic data);

        /// <summary>
        /// SignalR接收信息
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        Task ReceiveMessageAsync(dynamic data);
    }
}
