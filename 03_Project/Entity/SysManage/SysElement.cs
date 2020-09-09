﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 页面元素表
    /// </summary>
    [Table("sys_element")]
    public partial class SysElement : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 菜单Id
        /// </summary>
        [Description("菜单Id")]
        public long menu_id { get; set; }

        /// <summary>
        /// 元素编码
        /// </summary>
        [Description("元素编码")]
        public string elem_code { get; set; }

        /// <summary>
        /// 元素名称
        /// </summary>
        [Description("元素名称")]
        public string elem_name { get; set; }

        /// <summary>
        /// 位置
        /// </summary>
        [Description("位置")]
        public string location { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        public int sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        public string description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Description("备注")]
        public string remark { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
