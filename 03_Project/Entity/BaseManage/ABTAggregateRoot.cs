using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 聚合根
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
    [NotMapped]
    public abstract class ABTAggregateRoot<TEntity> : ICloneable where TEntity : class
    {
        #region 属性
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Browsable(false)]
        [Description("主键Id")]
        public long id { get; set; }

        /// <summary>
        /// 是否删除：0否 1是
        /// </summary>
        [Description("是否删除")]
        public int is_delete { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        [Description("创建用户Id")]
        public long create_user_id { get; set; }

        /// <summary>
        /// 修改用户Id
        /// </summary>
        [Description("修改用户Id")]
        public long modify_user_id { get; set; }

        /// <summary>
        /// 删除用户Id
        /// </summary>
        [Description("删除用户Id")]
        public long delete_user_id { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Description("创建时间")]
        public DateTime create_time { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Description("修改时间")]
        public DateTime modify_time { get; set; }

        /// <summary>
        /// 删除时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Description("删除时间")]
        public DateTime delete_time { get; set; }
        #endregion 属性

        public ABTAggregateRoot()
        {
            id = 0;
            is_delete = 0;//：0否 1是
            create_user_id = 0;
            modify_user_id = 0;
            delete_user_id = 0;
            DateTime time = DateTime.Now;
            create_time = time;
            modify_time = time;
            delete_time = time;
        }

        public object Clone()
        {
            return this.MemberwiseClone();
        }
    }
}
