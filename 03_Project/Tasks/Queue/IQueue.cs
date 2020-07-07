using System;

namespace Tasks
{
    /// <summary>
    /// 队列
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IQueue<T>
    {
        /// <summary>
        /// 判断队列是否为空
        /// </summary>
        /// <returns></returns>
        bool IsEmpty();

        /// <summary>
        /// 判断队列是否为满
        /// </summary>
        /// <returns></returns>
        bool IsFull();

        /// <summary>
        /// 是否存在
        /// </summary>
        /// <param name="element"></param>
        /// <returns></returns>
        bool IsExist(T element);

        /// <summary>
        /// 取队头元素
        /// </summary>
        /// <returns></returns>
        T GetHead();

        /// <summary>
        /// 取队尾元素
        /// </summary>
        /// <returns></returns>
        T GetTail();

        /// <summary>
        /// 入队列操作
        /// </summary>
        /// <param name="element"></param>
        /// <returns></returns>
        bool EnQueue(T element);

        /// <summary>
        /// 批量入队列操作
        /// </summary>
        /// <param name="elements"></param>
        /// <param name="offset"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        bool EnQueue(T[] elements, int offset, int count);

        /// <summary>
        /// 出队列操作
        /// </summary>
        /// <returns></returns>
        T DeQueue();

        /// <summary>
        /// 批量出队列操作
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        T[] DeQueue(int count);

        /// <summary>
        /// 遍历
        /// </summary>
        void Display();

        /// <summary>
        /// 清空队列
        /// </summary>
        void Clear();

        /// <summary>
        /// 清空指定数量队列
        /// </summary>
        /// <param name="count"></param>
        void Clear(int count);
    }
}
