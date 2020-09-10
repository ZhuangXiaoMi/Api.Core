using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 用户与用户组关联表
    /// </summary>
    [Table("sys_user_grp_user")]
    public partial class SysUserGrpUser : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 用户Id
        /// </summary>
        [Description("用户Id")]
        public long user_id { get; set; }

        /// <summary>
        /// 用户组Id
        /// </summary>
        [Description("用户组Id")]
        public long grp_user_id { get; set; }

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
