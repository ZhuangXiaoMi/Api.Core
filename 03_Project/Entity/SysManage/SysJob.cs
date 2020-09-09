﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 岗位表
    /// </summary>
    [Table("sys_job")]
    public partial class SysJob : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 岗位名称
        /// </summary>
        [Description("岗位名称")]
        public string job_name { get; set; }

        /// <summary>
        /// 昵称
        /// </summary>
        [Description("昵称")]
        public string nickname { get; set; }

        /// <summary>
        /// 部门Id
        /// </summary>
        [Description("部门Id")]
        public long dept_id { get; set; }

        /// <summary>
        /// 最低薪资
        /// </summary>
        [Description("最低薪资")]
        public decimal min_salary { get; set; }

        /// <summary>
        /// 最高薪资
        /// </summary>
        [Description("最高薪资")]
        public decimal max_salary { get; set; }

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

        /// <summary>
        /// 是否启用：0否 1是
        /// </summary>
        [Description("是否启用")]
        public int is_enabled { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
