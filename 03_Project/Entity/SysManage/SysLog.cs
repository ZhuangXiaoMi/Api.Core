using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_Log")]
    [Display(Name = "日志表")]
    public partial class SysLog : ABTAggregateRoot<SysLog>, ICreateEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }
        //public int LogId { get; set; }

        /// <summary>
        /// 日志类型：1：FATAL；2：ERROR；3：WARN；4：INFO；5：DEBUG；
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Range(1, 5, ErrorMessage = "异常值")]
        [Display(Name = "日志类型", Description = "1：FATAL；2：ERROR；3：WARN；4：INFO；5：DEBUG；")]
        public int LogType { get; set; }

        /// <summary>
        /// 操作IP
        /// </summary>
        [Display(Name = "操作IP")]
        public string IP { get; set; }

        /// <summary>
        /// 系统模块Id
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "系统模块Id")]
        public int ModuleId { get; set; }

        /// <summary>
        /// 系统模块名称
        /// </summary>
        [Display(Name = "系统模块名称")]
        public string ModuleName { get; set; }

        /// <summary>
        /// 请求地址
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [DataType(DataType.Url)]
        [Display(Name = "请求地址")]
        public string RequestURL { get; set; }

        /// <summary>
        /// 操作方式
        /// </summary>
        [Display(Name = "操作方式")]
        public string Method { get; set; }

        /// <summary>
        /// 操作提交数据
        /// </summary>
        [Display(Name = "操作提交数据")]
        public string Params { get; set; }

        /// <summary>
        /// 是否成功：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否成功", Description = "0：否；1：是；")]
        public bool IsSuccess { get; set; }

        /// <summary>
        /// 异常信息
        /// </summary>
        [StringLength(500, ErrorMessage = "少于{0}个字")]
        [Display(Name = "异常信息")]
        public string Exception { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [StringLength(500, ErrorMessage = "少于{0}个字")]
        [Display(Name = "描述")]
        public string Description { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        [Display(Name = "创建用户Id")]
        public int CreateUserId { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "创建时间")]
        public DateTime CreateTime { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
