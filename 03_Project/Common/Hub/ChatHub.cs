using Microsoft.AspNetCore.SignalR;
using System;
using System.Threading.Tasks;

namespace Common.Hub
{
    public class ChatHub : Hub<IChatClient>
    {
        /// <summary>
        /// 向指定群组发送信息
        /// </summary>
        /// <param name="groupName">组名</param>
        /// <param name="message">信息内容</param>
        /// <returns></returns>
        public async Task SendMessageToGroupAsync(string groupName, string message)
        {
            await Clients.Group(groupName).ReceiveMessageAsync(message);
        }

        /// <summary>
        /// 加入指定组
        /// </summary>
        /// <param name="groupName">组名</param>
        /// <returns></returns>
        public async Task AddToGroupAsync(string groupName)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, groupName);
        }

        /// <summary>
        /// 移除指定组
        /// </summary>
        /// <param name="groupName">组名</param>
        /// <returns></returns>
        public async Task RemoveFromGroupAsync(string groupName)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, groupName);
        }

        /// <summary>
        /// 向指定成员发送信息
        /// </summary>
        /// <param name="user">成员名</param>
        /// <param name="message">信息内容</param>
        /// <returns></returns>
        public async Task SendPrivateMessageAsync(string user, string message)
        {
            await Clients.User(user).ReceiveMessageAsync(message);
        }

        /// <summary>
        /// 当连接建立时运行
        /// </summary>
        /// <returns></returns>
        public override Task OnConnectedAsync()
        {
            //TODO..
            return base.OnConnectedAsync();
        }

        /// <summary>
        /// 当链接断开时运行
        /// </summary>
        /// <param name="ex"></param>
        /// <returns></returns>
        public override Task OnDisconnectedAsync(Exception ex)
        {
            //TODO..
            return base.OnDisconnectedAsync(ex);
        }

        public async Task SendMessageAsync(string user, string message)
        {
            await Clients.All.ReceiveMessageAsync(user, message);
        }

        /// <summary>
        /// 定义通讯管道，管理服务端和客户端的连接
        /// 1.客户端调用 GetLatestCountAsync 像订阅
        /// </summary>
        /// <param name="random"></param>
        /// <returns></returns>
        public async Task GetLatestCountAsync(string random)
        {
            //2.服务端主动向客户端发送数据，名字不能错
            //await Clients.All.ReceiveUpdateAsync(LogLock.GetLogData());

            //3.客户端再通过 ReceiveUpdateAsync 接收
        }
    }
}
