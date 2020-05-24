using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Common.Redis
{
    /// <summary>
    /// Redis缓存
    /// </summary>
    public interface IRedisCacheManage
    {
        /// <summary>
        /// 是否存在
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        Task<bool> ExistsAsync(string key);

        /// <summary>
        /// 增加/修改
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="expireTime"></param>
        /// <returns></returns>
        Task<bool> SetAsync(string key, dynamic value, TimeSpan? expireTime = null);

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        Task<bool> DeleteAsync(string key);

        /// <summary>
        /// 获取连接数
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        Task<long> GetCountAsync(string key);

        /// <summary>
        /// 获取值
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        Task<string> GetAsync(string key);

        /// <summary>
        /// 获取值
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        Task<TEntity> GetAsync<TEntity>(string key);

        /// <summary>
        /// 根据值的正则，获取Keys
        /// </summary>
        /// <param name="pattern"></param>
        /// <returns></returns>
        IEnumerable<string> GetKeys(string pattern);

        /// <summary>
        /// Hash 增加/修改
        /// </summary>
        /// <param name="key"></param>
        /// <param name="hashField"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        Task<bool> HashSetAsync(string key, string hashField, dynamic value);

        /// <summary>
        /// 删除 Hash
        /// </summary>
        /// <param name="key"></param>
        /// <param name="hashField"></param>
        /// <returns></returns>
        Task<bool> HashDeleteAsync(string key, string hashField);

        /// <summary>
        /// 获取 Hash 值
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        Task<IEnumerable<dynamic>> GetHashsAsync(string key);

        /// <summary>
        /// 清除
        /// </summary>
        /// <returns></returns>
        Task Clear();
    }
}
