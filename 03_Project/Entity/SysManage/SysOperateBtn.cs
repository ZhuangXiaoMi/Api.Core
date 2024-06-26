﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 操作按钮表
    /// </summary>
    [Table("sys_operate_btn")]
    public partial class SysOperateBtn : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 菜单Id
        /// </summary>
        [Description("菜单Id")]
        public long menu_id { get; set; }

        /// <summary>
        /// 操作按钮编码
        /// </summary>
        [Description("操作按钮编码")]
        public string oper_btn_code { get; set; }

        /// <summary>
        /// 操作按钮名称
        /// </summary>
        [Description("操作按钮名称")]
        public string oper_btn_name { get; set; }

        /// <summary>
        /// 事件
        /// </summary>
        [Description("事件")]
        public string btn_event { get; set; }

        /// <summary>
        /// 链接
        /// </summary>
        [Description("链接")]
        public string url { get; set; }

        /// <summary>
        /// 图标
        /// </summary>
        [Description("图标")]
        public string icon { get; set; }

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
