using System.Threading.Tasks;

namespace Common.Hub
{
    /// <summary>
    /// 客户端使用接口
    /// </summary>
    public interface IChatClient
    {
        /// <summary>
        /// 上线通知
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        Task OnLineAsync(dynamic data);

        /// <summary>
        /// 下线通知
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        Task OffLineAsync(dynamic data);

        /// <summary>
        /// SignalR接收信息
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        Task ReceiveMessageAsync(dynamic data);

        /// <summary>
        /// SignalR接收信息
        /// </summary>
        /// <param name="user">指定接收客户端</param>
        /// <param name="message">信息内容</param>
        /// <returns></returns>
        Task ReceiveMessageAsync(string user, string message);

        Task ReceiveUpdateAsync(dynamic data);
    }
}
