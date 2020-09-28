using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 地区表
    /// </summary>
    [Table("sys_area")]
    public partial class SysArea : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 上级地区Id
        /// </summary>
        [Description("上级地区Id")]
        public long parent_id { get; set; }

        /// <summary>
        /// 族谱ids
        /// </summary>
        [Description("族谱ids")]
        public string parent_ids { get; set; }

        /// <summary>
        /// 上级行政区划代码
        /// </summary>
        [Description("上级行政区划代码")]
        public string parent_division { get; set; }

        /// <summary>
        /// 行政区划代码
        /// </summary>
        [Description("行政区划代码")]
        public string administrative_division { get; set; }

        /// <summary>
        /// 邮政编码
        /// </summary>
        [Description("邮政编码")]
        public string area_code { get; set; }

        /// <summary>
        /// 行政区划简码
        /// </summary>
        [Description("行政区划简码")]
        public string simple_division { get; set; }

        /// <summary>
        /// 地区名称
        /// </summary>
        [Description("地区名称")]
        public string area_name { get; set; }

        /// <summary>
        /// 简称
        /// </summary>
        [Description("简称")]
        public string simple_name { get; set; }

        /// <summary>
        /// 行政区划级别：0国家 1省级 2地级 3县级 4乡级 5村庄
        /// </summary>
        [Description("行政区划级别")]
        public int level { get; set; }

        /// <summary>
        /// 城乡分类代码：100城镇 110城区 111主城区 112城乡结合区 120镇区 121镇中心区 122镇乡结合区 123特殊区域 200乡村 210乡中心区 220村庄
        /// </summary>
        [Description("城乡分类代码")]
        public string category { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        public int sort { get; set; }

        /// <summary>
        /// 下级数量
        /// </summary>
        [Description("下级数量")]
        public int sub { get; set; }

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
