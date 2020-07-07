using System;
using System.Collections;
using System.Collections.Generic;

namespace Tasks
{
    /// <summary>
    /// 循环队列：求余索引循环，先进先出
    /// 延申：线程安全队列(并发队列)、生产/消费(阻塞队列)
    /// 基于数组的循环队列(有界队列)利用CAS原子操作，实现高效的并发队列，导致循环队列比链式队列应用广泛
    /// 使用场景：线程池、缓存区【串口通信（封包、拆包、粘包、校验）、TCP通信、实时大数据传输】
    /// 源地址：https://www.cnblogs.com/greyhh/p/4812562.html
    /// 扩展：https://www.cnblogs.com/huangguoming/p/10628132.html
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class CircleQueue<T> : IQueue<T>, IEnumerable<T>, IDisposable
    {
        #region 全局变量
        private int _head;//队首索引，第一个元素位置
        private int _tail;//队尾索引，指向最后一个元素下个空节点
        private int _count;//队列元素个数
        private int _capacity;//队列容量，实际少1
        private T[] _queue;//队列数组
        private static readonly object _readLock = new object();
        private static readonly object _operateLock = new object();

        /// <summary>
        /// 队列元素个数
        /// </summary>
        public int Count
        {
            get
            {
                //return (_tail - _head + _capacity) % _capacity;
                return _count;
            }
            private set { _count = value; }
        }
        /// <summary>
        /// 队列容量
        /// </summary>
        public int Capacity
        {
            get
            {
                return _capacity;
            }
        }
        public T this[int index]
        {
            get
            {
                if (index >= _capacity)
                {
                    throw new IndexOutOfRangeException("索引溢出");
                }

                int peek = (_head + index) % _capacity;
                return _queue[peek];
            }
            private set { _queue[index] = value; }
        }
        #endregion 全局变量

        public CircleQueue(int capacity)
        {
            if (capacity < 1)
            {
                throw new IndexOutOfRangeException("队列容量不能小于1");
            }

            _head = 0;
            _tail = 0;
            _count = 0;
            _capacity = capacity;
            _queue = new T[_capacity];
        }

        #region 接口
        #region 判断队列是否为空
        public bool IsEmpty()
        {
            //return _head == _tail;
            return _count == 0;
        }
        #endregion 判断队列是否为空

        #region 判断队列是否为满
        public bool IsFull()
        {
            //return _capacity == 0 || _head == (_tail + 1) % _capacity;
            return _count == _capacity;
        }
        #endregion 判断队列是否为满

        #region 是否存在
        public bool IsExist(T element)
        {
            int index = _head;
            for (int i = 0; i < _count; i++)
            {
                if (element.Equals(_queue[index]))
                {
                    return true;
                }
                index = (index + 1) % _capacity;
            }
            return false;
        }
        #endregion 是否存在

        #region 取队头元素
        public T GetHead()
        {
            if (IsEmpty())
            {
                return default(T);
            }
            return _queue[_head];
        }
        #endregion 取队头元素

        #region 取队尾元素
        public T GetTail()
        {
            if (IsEmpty())
            {
                return default(T);
            }
            //int index = _tail == 0 ? _capacity - 1 : (_tail - 1) % _capacity;
            int index = (_tail - 1 + _capacity) % _capacity;
            return _queue[index];
        }
        #endregion 取队尾元素

        #region 入队列操作
        public bool EnQueue(T element)
        {
            lock (_operateLock)
            {
                if (IsFull())
                {
                    //return false;
                    CapacityExpansion();
                }

                _queue[_tail] = element;
                _tail = (_tail + 1) % _capacity;
                _count++;
                return true;
            }
        }
        #endregion 入队列操作

        #region 批量入队列操作
        public bool EnQueue(T[] elements, int offset = 0, int count = 0)
        {
            int len = elements.Length;
            if (count == 0)
            {
                count = len;
            }
            if (elements == null || len <= 0)
            {
                throw new ArgumentOutOfRangeException($"{typeof(T)}对象数组为空");
            }
            if (offset < 0 || offset >= len)
            {
                throw new IndexOutOfRangeException("offset索引溢出");
            }
            if (count < 1 || (offset + count) > len)
            {
                throw new ArgumentOutOfRangeException("count参数有误");
            }

            lock (_operateLock)
            {
                if (IsFull() || count >= _capacity - _count)
                {
                    //return false;
                    CapacityExpansion(count);
                }

                if (_tail + count > _capacity)//队尾索引后不够存，从0开始继续存
                {
                    //System.Diagnostics.Debug.WriteLine("...");
                    int overCount = _tail + count - _capacity;//超出数量
                    int tailEndCount = _capacity - _tail;//队尾索引后容量
                    Array.Copy(elements, offset, _queue, _tail, tailEndCount);//填充完队尾后空余
                    Array.Copy(elements, offset + tailEndCount, _queue, 0, overCount);//从0继续入队列
                }
                else
                {
                    Array.Copy(elements, offset, _queue, _tail, count);
                }

                _tail = (_tail + count) % _capacity;
                _count = _count + count;
                return true;
            }
        }
        #endregion 批量入队列操作

        #region 出队列操作
        public T DeQueue()
        {
            if (IsEmpty())
            {
                return default(T);
            }

            lock (_operateLock)
            {
                T temp = _queue[_head];
                _head = (_head + 1) % _capacity;
                _count--;
                return temp;
            }
        }
        #endregion 出队列操作

        #region 批量出队列操作
        public T[] DeQueue(int count = 1)
        {
            if (IsEmpty())
            {
                return null;
            }
            if (count < 1)
            {
                throw new ArgumentOutOfRangeException("count参数有误");
            }
            if (count > _count)
            {
                count = _count;
            }

            lock (_operateLock)
            {
                T[] tempArr = new T[count];
                if (_head + count > _capacity)//队首索引后不够数，从0开始继续出队列
                {
                    int headEndCount = _capacity - _head;//队首索引后容量
                    Array.Copy(_queue, _head, tempArr, 0, headEndCount);//出队首后元素
                    Array.Copy(_queue, 0, tempArr, headEndCount, count - headEndCount);//从0继续出队列
                }
                else
                {
                    Array.Copy(_queue, _head, tempArr, 0, count);
                }

                _head = (_head + count) % _capacity;
                _count = _count - count;
                return tempArr;
            }
        }
        #endregion 批量出队列操作

        #region 遍历
        public void Display()
        {
            for (int i = _head, len = _head + _count; i < len; i++)
            {
                Console.WriteLine(_queue[i % _capacity]);
            }
        }
        #endregion 遍历

        #region 清空队列
        public void Clear()
        {
            lock (_operateLock)
            {
                Array.Clear(_queue, 0, _capacity);
                _head = 0;
                _tail = 0;
                _count = 0;
            }
        }
        #endregion 清空队列

        #region 清空指定数量队列
        public void Clear(int count)
        {
            lock (_operateLock)
            {
                if (count >= _count)//清理数量不小于已有数量，则全部清理
                {
                    Clear();
                }
                else
                {
                    if (_head + count > _capacity)
                    {
                        int headEndCount = _capacity - _head;//队首索引后容量
                        Array.Clear(_queue, _head, headEndCount);
                        Array.Clear(_queue, 0, count - headEndCount);
                    }
                    else
                    {
                        Array.Clear(_queue, _head, count);
                    }

                    _head = (_head + count) % _capacity;
                    _count = _count - count;
                }
            }
        }
        #endregion 清空指定数量队列

        #region IEnumerable<T>
        /// <summary>
        /// 源地址：https://www.cnblogs.com/ArtofDesign/p/3612492.html
        /// </summary>
        /// <returns></returns>
        public IEnumerator<T> GetEnumerator()
        {
            foreach (T item in _queue)
            {
                if (item != null)
                {
                    yield return item;//yield return替代新增类(继承IEnumerator接口)
                }
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
        #endregion IEnumerable<T>

        #region Dispose
        public void Dispose()
        {
            Clear();
            _queue = null;
        }
        #endregion Dispose 
        #endregion 接口

        #region 公共方法
        /// <summary>
        /// 容器扩容
        /// </summary>
        /// <param name="count"></param>
        /// <returns></returns>
        private bool CapacityExpansion(int count = 1)
        {
            int newCapacity = ((int)Math.Ceiling(1.0 * count / _capacity) + 1) * _capacity;
            T[] newQueue = new T[newCapacity];
            if (newQueue == null)
            {
                throw new ArgumentOutOfRangeException("数据容量过大，超出系统内存大小");
            }

            //队列索引尚未回绕
            if (_head == 0)//_tail = _capacity - 1
            {
                /* 
                 *       head:0      tail:_capacity - 1
                 *         ↓            ↓
                 * 旧队列：[X X X X X X X O]
                 * 
                 * */
                //Array.Resize(ref _queue, _capacity * 2);//不使用，索引、队列顺序需要调整
                //将旧队列数据转移到新队列中
                Array.Copy(_queue, newQueue, _capacity);
            }
            else
            {
                /* 
                 *         head:4
                 *           ↓
                 * 旧队列：[O X X X X X X X]
                 *         ↑
                 *       tail:0
                 * 
                 *         head:4      tail:_capacity
                 *           ↓            ↓
                 * 新队列：[O X X X X X X X O O O O O]
                 * 
                 * */

                //队列回绕，需要拷贝两次
                //第一次：将队首至旧队列数组最大长度的数据拷贝到新队列数组中
                Array.Copy(_queue, _head, newQueue, _head, _capacity - _tail - 1);
                //(_capacity - _tail - 1) = (_capacity - _head)
                //第二次：将旧队列数组起始位置至队尾的数据拷贝到新队列数组中
                Array.Copy(_queue, 0, newQueue, _capacity, _tail + 1);
                //将队尾索引改为新队列数组的索引
                _tail = _capacity;
            }

            _queue = newQueue;
            _capacity = newCapacity;

            return true;
        }
        #endregion 公共方法

    }
}
