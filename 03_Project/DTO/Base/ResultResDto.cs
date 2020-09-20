﻿using System.ComponentModel;

namespace DTO
{
    public class ResultResDto
    {
        /// <summary>
        /// 状态码
        /// </summary>
        [Description("状态码")]
        public int code { get; set; }

        /// <summary>
        /// 返回信息
        /// </summary>
        [Description("返回信息")]
        public string msg { get; set; }

        public ResultResDto()
        {
            code = DEFINE.SUCCESS;
            msg = "请求成功";
        }
    }

    public class ResultResDto<T> : ResultResDto where T : class, new()
    {
        public T data { get; set; }

        public ResultResDto()
        {
            data = new T();
        }
    }
}
