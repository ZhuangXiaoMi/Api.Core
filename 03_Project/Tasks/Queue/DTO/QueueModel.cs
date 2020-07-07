using System;

namespace Tasks
{
    public class QueueModel
    {
        public QueueModel()
        {
            CreateTime = DateTime.Now;
        }

        /// <summary>
        /// 唯一标识
        /// </summary>
        public string Key { get; set; }

        /// <summary>
        /// 委托
        /// </summary>
        public Action Action { get; set; }

        /// <summary>
        /// 入队列时间
        /// </summary>
        public DateTime CreateTime { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        public string Description { get; set; }
    }
}
