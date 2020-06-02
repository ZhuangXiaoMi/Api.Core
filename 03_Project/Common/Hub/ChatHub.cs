using Common.Redis;
using DTO.Hub;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Common.Hub
{
    /// <summary>
    /// SignalR 强类型 Hub
    /// </summary>
    //[Authorize]
    public class ChatHub : Hub<IChatClient>, IChatService
    {
        private readonly ILogger<ChatHub> _logger;
        private readonly IRedisCacheManage _redisCacheManage;
        public readonly string PREFIXUSER = "signalr_u_";
        public readonly string PREFIXGROUP = "signalr_g_";

        public ChatHub(ILogger<ChatHub> logger, IRedisCacheManage redisCacheManage)
        {
            _logger = logger;
            _redisCacheManage = redisCacheManage;
        }

        /// <summary>
        /// 当连接建立时运行
        /// </summary>
        /// <returns></returns>
        public override async Task OnConnectedAsync()
        {
            //await Clients.All.OnNotifyAsync(new { UserId = Context.User.Identity.Name, Name = Context.User.Identity.Name, ConnectId = Context.ConnectionId });
            var userId = Context.User.Identity.Name;
            var connectId = Context.ConnectionId;// 客户端的唯一标识
            var groups = Context.GetHttpContext().Request.Query["group"].FirstOrDefault();
            _logger.LogDebug($"OnConnectedAsync----userId:{userId},groups:{groups},connectionId:{connectId}");
            if (!string.IsNullOrWhiteSpace(userId))
            {
                await _redisCacheManage.SetAsync($"{PREFIXUSER}{userId}", connectId);
                await AddToGroupAsync(userId, connectId, groups?.Split(','));
                await OnLineNotifyAsync(userId, connectId);
            }
            await base.OnConnectedAsync();
        }

        /// <summary>
        /// 当链接断开时运行
        /// </summary>
        /// <param name="ex"></param>
        /// <returns></returns>
        public override async Task OnDisconnectedAsync(Exception ex)
        {
            var userId = Context.User.Identity.Name;
            var connectId = Context.ConnectionId;
            var groups = Context.GetHttpContext().Request.Query["group"].FirstOrDefault();
            _logger.LogDebug($"OnDisconnectedAsync----userId:{userId},groups:{groups},connectionId:{connectId}");
            if (!string.IsNullOrWhiteSpace(userId))
            {
                await _redisCacheManage.DeleteAsync($"{PREFIXUSER}{userId}");
                await OffLineNotifyAsync(userId, connectId);
            }
            await RemoveFromGroupAsync(connectId, groups?.Split(','));
            await base.OnDisconnectedAsync(ex);
        }

        /// <summary>
        /// 加入组
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="connectionId"></param>
        /// <param name="groups"></param>
        /// <returns></returns>
        private async Task AddToGroupAsync(string userId, string connectionId, params string[] groups)
        {
            if (!string.IsNullOrWhiteSpace(userId) && groups != null && groups.Length > 0)
            {
                foreach (var group in groups)
                {
                    await Groups.AddToGroupAsync(connectionId, group);
                    await _redisCacheManage.HashSetAsync($"{PREFIXGROUP}{group}", connectionId, $"{PREFIXUSER}{userId}");
                }
            }
        }

        /// <summary>
        /// 从组中移除
        /// </summary>
        /// <param name="connectionId"></param>
        /// <param name="groups"></param>
        /// <returns></returns>
        private async Task RemoveFromGroupAsync(string connectionId, params string[] groups)
        {
            if (groups != null && groups.Length > 0)
            {
                foreach (var group in groups)
                {
                    await Groups.RemoveFromGroupAsync(connectionId, group);
                    await _redisCacheManage.HashDeleteAsync($"{PREFIXGROUP}{group}", connectionId);
                }
            }
        }

        /// <summary>
        /// 上线通知（只有用户的第一个连接才通知）
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="connectionId"></param>
        /// <returns></returns>
        private async Task OnLineNotifyAsync(string userId, string connectionId)
        {
            var userConnectCount = await _redisCacheManage.GetCountAsync($"{PREFIXUSER}{userId}");
            await Clients.All.OnLineAsync(new OnLineDTO()
            {
                UserId = userId,
                ConnectionId = connectionId,
                IsFirst = userConnectCount == 1
            });
        }

        /// <summary>
        /// 下线通知（只有当用户一个连接都没了才算下线）
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="connectionId"></param>
        /// <returns></returns>
        private async Task OffLineNotifyAsync(string userId, string connectionId)
        {
            var userConnectCount = await _redisCacheManage.GetCountAsync($"{PREFIXUSER}{userId}");
            await Clients.All.OffLineAsync(new OffLineDTO()
            {
                UserId = userId,
                ConnectionId = connectionId,
                IsLast = userConnectCount == 0
            });
        }

        /// <summary>
        /// 向指定群组发送信息
        /// </summary>
        /// <param name="data">信息内容</param>
        /// <param name="groups"></param>
        /// <returns></returns>
        public async Task SendMessageToGroupAsync(dynamic data, params string[] groups)
        {
            if (groups != null && groups.Length > 0)
            {
                foreach (var group in groups)
                {
                    await Clients.Group(group).ReceiveMessageAsync(data);
                }
            }
        }

        /// <summary>
        /// 向指定成员发送信息
        /// </summary>
        /// <param name="userId">用户</param>
        /// <param name="data">信息内容</param>
        /// <returns></returns>
        public async Task SendMessageToUserAsync(string userId, dynamic data)
        {
            //await Clients.Client(connectionId).ReceiveMessageAsync(data);
            await Clients.User(userId).ReceiveMessageAsync(data);
        }

        /// <summary>
        /// 向所有成员发送信息
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public async Task SendMessageToAllAsync(dynamic data)
        {
            await Clients.All.ReceiveMessageAsync(data);
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

            var userId = Context.User.Identity.Name;
            int count = 0;
            while (count < 10)
            {
                count++;
                Thread.Sleep(1000);
                await SendMessageToUserAsync(userId, new { count });
            }

            await SendMessageToUserAsync(userId, new { Message = "Finish" });

            //3.客户端再通过 ReceiveUpdateAsync 接收
        }
    }
}
