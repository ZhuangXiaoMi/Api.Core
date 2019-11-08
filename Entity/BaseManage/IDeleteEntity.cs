using System;

namespace Entity.BaseManage
{
    public interface IDeleteEntity
    {
        /// <summary>
        /// 是否删除：0 否；1 是；
        /// </summary>
        bool IsDelete { get; set; }

        /// <summary>
        /// 删除用户Id
        /// </summary>
        int? DeleteUserId { get; set; }

        /// <summary>
        /// 删除时间
        /// </summary>
        DateTime? DeleteTime { get; set; }

        void Remove();
    }
}
