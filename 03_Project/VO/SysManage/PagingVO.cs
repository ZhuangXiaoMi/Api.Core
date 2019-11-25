using System;
using System.Collections.Generic;
using System.Text;

namespace VO.SysManage
{
    /// <summary>
    /// 分页
    /// </summary>
    public partial class PagingVO
    {
        /// <summary>
        /// 当前页码
        /// </summary>
        public int CurrentPage { get; set; }

        /// <summary>
        /// 每页行数
        /// </summary>
        public int PageSize { get; set; }

        /// <summary>
        /// 总记录数
        /// </summary>
        public int TotalRecord { get; set; }

        /// <summary>
        /// 总页数
        /// </summary>
        public int TotalPage
        {
            get
            {
                return (int)Math.Ceiling(1.0 * TotalRecord / PageSize);
            }
        }

        /// <summary>
        /// 记录单位
        /// </summary>
        public string RecordUnit { get; set; }

        /// <summary>
        /// 记录名称
        /// </summary>
        public string RecordName { get; set; }

        public PagingVO()
        {
            CurrentPage = 1;
            PageSize = 20;
            RecordUnit = "条";
            RecordName = "记录";
        }
    }
}
