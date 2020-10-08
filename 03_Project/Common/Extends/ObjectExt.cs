using System;

namespace Common
{
    public static class ObjectExt
    {
        public static string ParseToString(this object thisValue)
        {
            try
            {
                if (thisValue != null)
                {
                    return thisValue.ToString().Trim();
                }
                return string.Empty;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }

        public static bool ParseToBool(this object thisValue, bool errorValue = false)
        {
            try
            {
                bool result = errorValue;
                if (thisValue != null && !Convert.IsDBNull(thisValue) && thisValue != DBNull.Value && bool.TryParse(thisValue.ToString(), out result))
                {
                    return result;
                }
                return result;
            }
            catch (Exception)
            {
                return errorValue;
            }
        }

        public static int ParseToInt(this object thisValue, int errorValue = 0)
        {
            try
            {
                int result = errorValue;
                //null：引用型变量；Convert.IsDBNull()：对象；DBNull.Value：数据库dt.Rows[0][0]；
                if (thisValue != null && !Convert.IsDBNull(thisValue) && thisValue != DBNull.Value && int.TryParse(thisValue.ToString(), out result))
                {
                    return result;
                }
                return result;
            }
            catch (Exception)
            {
                return errorValue;
            }
        }

        public static DateTime ParseToDateTime(this object thisValue)
        {
            try
            {
                DateTime result = DateTime.MinValue;
                if (thisValue != null && !Convert.IsDBNull(thisValue) && thisValue != DBNull.Value && DateTime.TryParse(thisValue.ToString(), out result))
                {
                    return result;
                }
                return result;
            }
            catch (Exception)
            {
                return default(DateTime);
            }
        }
    }
}
