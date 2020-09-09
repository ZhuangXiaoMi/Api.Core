using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 任职表
    /// </summary>
    [Table("sys_job_history")]
    public partial class SysJobHistory : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 用户Id
        /// </summary>
        [Description("用户Id")]
        public long user_id { get; set; }

        /// <summary>
        /// 岗位Id
        /// </summary>
        [Description("岗位Id")]
        public long job_id { get; set; }

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
