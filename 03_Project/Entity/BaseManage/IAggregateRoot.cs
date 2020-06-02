using System;

namespace Entity.BaseManage
{
    public interface IAggregateRoot
    {
        /// <summary>
        /// 主键
        /// </summary>
        int Id { get; set; }
    }
}
