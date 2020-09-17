using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 部门表
    /// </summary>
    [Table("sys_dept")]
    public partial class SysDept : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 上级部门Id
        /// </summary>
        [Description("上级部门Id")]
        public long parent_id { get; set; }

        /// <summary>
        /// 族谱ids
        /// </summary>
        [Description("族谱ids")]
        public string parent_ids { get; set; }

        /// <summary>
        /// 部门编码
        /// </summary>
        [Description("部门编码")]
        public string dept_code { get; set; }

        /// <summary>
        /// 部门名称
        /// </summary>
        [Description("部门名称")]
        public string dept_name { get; set; }

        /// <summary>
        /// 简称
        /// </summary>
        [Description("简称")]
        public string simple_name { get; set; }

        /// <summary>
        /// 机构类型：1公司 2部门 3小组
        /// </summary>
        [Description("机构类型")]
        public int dept_type { get; set; }

        /// <summary>
        /// 机构等级：1一级 2二级 3三级 4四级
        /// </summary>
        [Description("机构等级")]
        public int level { get; set; }

        /// <summary>
        /// 当前层级顺序
        /// </summary>
        [Description("当前层级顺序")]
        public int seq { get; set; }

        /// <summary>
        /// 所属地区Id
        /// </summary>
        [Description("所属地区Id")]
        public long area_id { get; set; }

        /// <summary>
        /// 负责人Id
        /// </summary>
        [Description("负责人Id")]
        public long leader_id { get; set; }

        /// <summary>
        /// 联系地址
        /// </summary>
        [Description("联系地址")]
        public string address { get; set; }

        /// <summary>
        /// 固定电话
        /// </summary>
        [Description("固定电话")]
        public string telephone { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        [Description("邮箱")]
        public string email { get; set; }

        /// <summary>
        /// 是否允许编辑：0否 1是
        /// </summary>
        [Description("是否允许编辑")]
        public int is_allow_edit { get; set; }

        /// <summary>
        /// 是否允许删除：0否 1是
        /// </summary>
        [Description("是否允许删除")]
        public int is_allow_delete { get; set; }

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
