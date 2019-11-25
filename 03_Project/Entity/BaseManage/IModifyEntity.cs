using System;

namespace Entity.BaseManage
{
    public interface IModifyEntity
    {
        /// <summary>
        /// 主键
        /// </summary>
        int Id { get; set; }

        /// <summary>
        /// 修改用户Id
        /// </summary>
        int? ModifyUserId { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        DateTime? ModifyTime { get; set; }

        void Modify();
    }
}
