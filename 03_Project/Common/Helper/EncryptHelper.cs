using System;
using System.Security.Cryptography;
using System.Text;

namespace Common
{
    public class EncryptHelper
    {
        #region MD5
        /// <summary>
        /// 16位MD5加密
        /// </summary>
        /// <param name="cleartext">明文</param>
        /// <returns></returns>
        public static string MD5Encrypt16(string cleartext)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] buffer = Encoding.Default.GetBytes(cleartext);
            byte[] hashBuffer = md5.ComputeHash(buffer);
            string ciphertext = BitConverter.ToString(hashBuffer, 4, 8).Replace("-", string.Empty);
            return ciphertext;
        }

        /// <summary>
        /// 32位MD5加密
        /// </summary>
        /// <param name="cleartext">明文</param>
        /// <returns></returns>
        public static string MD5Encrypt32(string cleartext)
        {
            MD5 md5 = MD5.Create();
            byte[] buffer = Encoding.Default.GetBytes(cleartext);
            byte[] hashBuffer = md5.ComputeHash(buffer);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBuffer.Length; i++)
            {
                sb.Append(hashBuffer[i].ToString("x2"));
            }
            return sb.ToString();
        }

        /// <summary>
        /// 64位MD5加密
        /// </summary>
        /// <param name="cleartext">明文</param>
        /// <returns></returns>
        public static string MD5Encrypt64(string cleartext)
        {
            MD5 md5 = MD5.Create();
            byte[] buffer = Encoding.Default.GetBytes(cleartext);
            byte[] hashBuffer = md5.ComputeHash(buffer);
            string ciphertext = Convert.ToBase64String(hashBuffer);
            return ciphertext;
        }
        #endregion MD5

        #region RSA

        #endregion RSA

        #region SHA

        #endregion SHA
    }
}
