using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;

namespace Common
{
    public class LogLockService
    {
        private static ReaderWriterLockSlim _logLockSlim = new ReaderWriterLockSlim();
        private static string _logPath = string.Empty;

        public LogLockService(string logPath)
        {
            _logPath = logPath;
        }

        public static void WriteLog(string filename, string[] dataParas, bool isHeader = true)
        {
            try
            {
                //在开头写入独占，防止中间抛异常，导致释放次数大于请求次数触发异常
                _logLockSlim.EnterWriteLock();//读写锁写入模式独占

                var path = Path.Combine(_logPath, "Log");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                string logFilePath = Path.Combine(path, $"{filename}.log");

                var now = DateTime.Now;
                string logContent = String.Join("\r\n", dataParas);
                if (isHeader)
                {
                    logContent = (
                       "--------------------------------\r\n" +
                       DateTime.Now + "|\r\n" +
                       String.Join("\r\n", dataParas) + "\r\n"
                    );
                }

                File.AppendAllText(logFilePath, logContent);
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
            finally
            {
                _logLockSlim.ExitWriteLock();//一次请求对应一次释放
            }
        }

        public static string ReadLog(string path, Encoding encode)
        {
            string content = string.Empty;
            try
            {
                _logLockSlim.EnterReadLock();

                if (!File.Exists(path))
                {
                    content = null;
                }
                else
                {
                    StreamReader sr = new StreamReader(path, encode);
                    content = sr.ReadToEnd();
                    sr.Close();
                    sr.Dispose();
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                _logLockSlim.ExitReadLock();
            }
            return content;
        }

        public static List<LogInfoModel> GetLogInfo()
        {
            List<LogInfoModel> logs = new List<LogInfoModel>();

            #region AOP
            try
            {
                var logContent = ReadLog(Path.Combine(_logPath, "Log", "AOPLog.log"), Encoding.UTF8);

                if (!string.IsNullOrEmpty(logContent))
                {
                    var logLst = logContent.Split("--------------------------------")
                                    .Where(p => !string.IsNullOrEmpty(p) && p != "\n" && p != "\r\n")
                                    .Select(p => new LogInfoModel
                                    {
                                        Time = p.Split("|")[0].ParseToDateTime(),
                                        Content = p.Split("|")[1]?.Replace("\r\n", "<br>"),
                                        Object = "AOP",
                                    }).ToList();
                    logs.AddRange(logLst);
                }
            }
            catch (Exception ex) { }
            #endregion AOP

            #region EXC
            try
            {
                var logContent = ReadLog(Path.Combine(_logPath, "Log", $"GlobalExcepLogs_{DateTime.Now.ToString("yyyyMMdd")}.log"), Encoding.UTF8);

                if (!string.IsNullOrEmpty(logContent))
                {
                    var logLst = logContent.Split("--------------------------------")
                                    .Where(p => !string.IsNullOrEmpty(p) && p != "\n" && p != "\r\n")
                                    .Select(p => new LogInfoModel
                                    {
                                        Time = (p.Split("|")[0]).Split(',')[0].ParseToDateTime(),
                                        Content = p.Split("|")[1]?.Replace("\r\n", "<br>"),
                                        Object = "EXC",
                                    }).ToList();
                    logs.AddRange(logLst);
                }
            }
            catch (Exception ex) { }
            #endregion EXC

            #region SQL
            try
            {
                var logContent = ReadLog(Path.Combine(_logPath, "Log", "SqlLog.log"), Encoding.UTF8);

                if (!string.IsNullOrEmpty(logContent))
                {
                    var logLst = logContent.Split("--------------------------------")
                                    .Where(p => !string.IsNullOrEmpty(p) && p != "\n" && p != "\r\n")
                                    .Select(p => new LogInfoModel
                                    {
                                        Time = p.Split("|")[0].ParseToDateTime(),
                                        Content = p.Split("|")[1]?.Replace("\r\n", "<br>"),
                                        Object = "SQL",
                                    }).ToList();
                    logs.AddRange(logLst);
                }
            }
            catch (Exception ex) { }
            #endregion SQL

            #region ReqRes
            try
            {
                var logContent = JsonConvert.DeserializeObject<List<LogRequestDTO>>("[" + ReadLog(Path.Combine(_logPath, "Log", "RequestIPInfoLog.log"), Encoding.UTF8) + "]");

                var logLst = logContent.Where(p => p.Time.ParseToDateTime() >= DateTime.Today)
                                .Select(p => new LogInfoModel
                                {
                                    Time = p.Time.ParseToDateTime(),
                                    Content = $"IP:{p.IP}<br>{p.URL}",
                                    Object = "ReqRes",
                                }).ToList();
                logs.AddRange(logLst);
            }
            catch (Exception ex) { }

            //try
            //{
            //    var logContent = ReadLog(Path.Combine(_logPath, "Log", "RequestResponseLog.log"), Encoding.UTF8);

            //    if (!string.IsNullOrEmpty(logContent))
            //    {
            //        var logLst = logContent.Split("--------------------------------")
            //                        .Where(p => !string.IsNullOrEmpty(p) && p != "\n" && p != "\r\n")
            //                        .Select(p => new LogInfoModel
            //                        {
            //                            Time = p.Split("|")[0].ObjectToDateTime(),
            //                            Content = p.Split("|")[1]?.Replace("\r\n", "<br>"),
            //                            Object = "ReqRes",
            //                        }).ToList();
            //        logs.AddRange(logLst);
            //    }
            //}
            //catch (Exception ex) { }
            #endregion ReqRes

            logs = logs.Take(100).ToList();

            return logs;
        }

        public static LogWeekResponseDTO GetLogWeekInfo()
        {
            List<LogRequestDTO> logs = new List<LogRequestDTO>();
            List<LogWeekModel> logWeeks = new List<LogWeekModel>();
            List<string> columns = new List<string>();
            columns.Add("日期");

            try
            {
                logs = JsonConvert.DeserializeObject<List<LogRequestDTO>>("[" + ReadLog(Path.Combine(_logPath, "Log", "RequestIPInfoLog.log"), Encoding.UTF8) + "]");

                logWeeks = (from p in logs
                            group p by new { p.Week, p.URL } into g
                            select new LogWeekModel
                            {
                                Week = g.Key.Week,
                                URL = g.Key.URL,
                                Count = g.Count(),
                            }).ToList();

                //logWeeks = logWeeks.OrderByDescending(p => p.Count).Take(8).ToList();
            }
            catch (Exception ex) { }

            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.Append("[");

            var weeks = logWeeks.GroupBy(p => new { p.Week }).Select(p => p.First()).ToList();
            foreach (var week in weeks)
            {
                var currentWeek = logWeeks.Where(p => p.Week == week.Week).OrderByDescending(p => p.Count).Take(8).ToList();
                jsonBuilder.Append("{\"日期\":\"");
                jsonBuilder.Append(week.Week);
                jsonBuilder.Append("\",");

                foreach (var item in currentWeek)
                {
                    jsonBuilder.Append("\"");
                    jsonBuilder.Append(item.URL);
                    jsonBuilder.Append("\":\"");
                    jsonBuilder.Append(item.Count);
                    jsonBuilder.Append("\",");
                }
                jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
                jsonBuilder.Append("},");
            }

            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            jsonBuilder.Append("]");

            columns.AddRange(logWeeks.OrderByDescending(d => d.Count).Take(8).Select(d => d.URL).ToList());

            return new LogWeekResponseDTO()
            {
                Columns = columns,
                Rows = jsonBuilder.ToString(),
            };
        }

        public static LogDateResponseDTO GetLogDateInfo()
        {
            List<LogRequestDTO> logs = new List<LogRequestDTO>();
            List<LogDateModel> logDates = new List<LogDateModel>();
            try
            {
                logs = JsonConvert.DeserializeObject<List<LogRequestDTO>>("[" + ReadLog(Path.Combine(_logPath, "Log", "RequestIPInfoLog.log"), Encoding.UTF8) + "]");

                logDates = (from p in logs
                            group p by new { p.Date } into g
                            select new LogDateModel
                            {
                                Date = g.Key.Date,
                                Count = g.Count(),
                            }).ToList();

                logDates = logDates.OrderByDescending(d => d.Date).Take(7).ToList();
            }
            catch (Exception ex) { }

            return new LogDateResponseDTO()
            {
                Columns = new string[] { "date", "count" },
                Rows = logDates.OrderBy(d => d.Date).ToList(),
            };
        }

        public static LogDateResponseDTO GetLogHourInfo()
        {
            List<LogRequestDTO> logs = new List<LogRequestDTO>();
            List<LogDateModel> logDates = new List<LogDateModel>();
            try
            {
                logs = JsonConvert.DeserializeObject<List<LogRequestDTO>>("[" + ReadLog(Path.Combine(_logPath, "Log", "RequestIPInfoLog.log"), Encoding.UTF8) + "]");

                logDates = (from p in logs
                            where p.Time.ParseToDateTime() >= DateTime.Today
                            group p by new { hour = p.Time.ParseToDateTime().Hour } into g
                            select new LogDateModel
                            {
                                Date = g.Key.hour.ToString("00"),
                                Count = g.Count(),
                            }).ToList();

                logDates = logDates.OrderBy(d => d.Date).Take(24).ToList();
            }
            catch (Exception ex) { }

            return new LogDateResponseDTO()
            {
                Columns = new string[] { "date", "count" },
                Rows = logDates,
            };
        }
    }
}
