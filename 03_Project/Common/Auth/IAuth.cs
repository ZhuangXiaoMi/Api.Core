using System;

namespace Common
{
    public interface IAuth
    {
        /// <summary>
        /// 登录验证
        /// </summary>
        /// <param name="token"></param>
        /// <returns></returns>
        int CheckLogin(string token);

        /// <summary>
        /// 获取当前登录用户
        /// </summary>
        /// <returns></returns>
        AuthStrategyContext GetCurrentUser();

        /// <summary>
        /// 退出
        /// </summary>
        /// <returns></returns>
        bool Logout();
    }
}
