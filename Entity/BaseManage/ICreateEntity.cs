using System;

namespace Entity.BaseManage
{
    public interface ICreateEntity
    {
        /// <summary>
        /// 主键
        /// </summary>
        int Id { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        int CreateUserId { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        DateTime CreateTime { get; set; }

        void Create();
    }
}
