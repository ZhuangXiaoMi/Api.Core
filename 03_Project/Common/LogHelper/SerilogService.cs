﻿using Serilog;
using Serilog.Events;
using System;
using System.IO;

namespace Common
{
    public class SerilogService
    {
        /// <summary>
        /// 记录日常日志
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="dataParas"></param>
        /// <param name="isHeader"></param>
        public static void WriteSeriLog(string filename, string[] dataParas, bool isHeader = true)
        {
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
                .MinimumLevel.Override("Microsoft", LogEventLevel.Error)
                //.Enrich.FromLogContext()
                //.WriteTo.Console()
                //.WriteTo.File(Path.Combine($"log/Serilog/", $"{filename}.log"), rollingInterval: RollingInterval.Day, outputTemplate: "{Timestamp:yyyy-MM-dd HH:mm:ss.fff} [{Level}] {Message}{NewLine}{Exception}")
                .WriteTo.File(Path.Combine($"log/Serilog/", $"{filename}.log"), rollingInterval: RollingInterval.Infinite, outputTemplate: "{Message}{NewLine}{Exception}")
                .CreateLogger();

            string logContent = String.Join("\r\n", dataParas);
            if (isHeader)
            {
                logContent = (
                   "--------------------------------\r\n" +
                   DateTime.Now + "|\r\n" +
                   String.Join("\r\n", dataParas) + "\r\n"
                );
            }

            Log.Information(logContent);
            Log.CloseAndFlush();
        }

        /// <summary>
        /// 记录异常日志
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="message"></param>
        /// <param name="ex"></param>
        public static void WriteErrorSeriLog(string filename, string message, Exception ex)
        {
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
                .MinimumLevel.Override("Microsoft", LogEventLevel.Error)
                .WriteTo.File(Path.Combine($"log/Error/", $"{filename}.txt"), rollingInterval: RollingInterval.Day)
                .CreateLogger();
            Log.Error(ex, message);
            Log.CloseAndFlush();
        }
    }
}