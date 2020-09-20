﻿using System.ComponentModel;

namespace DTO
{
    public enum OrderByEnum
    {
        /// <summary>
        /// 升序
        /// </summary>
        [Description("升序")]
        ASC = 0,

        /// <summary>
        /// 降序
        /// </summary>
        [Description("降序")]
        DESC = 1
    }
}