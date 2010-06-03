using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Extensions
{
    public class GlobalUtils
    {
        public const string applicationName = "GlobusDataPad";

        /// <summary>
        /// Convert from UNIX timestamp.
        /// See http://codeclimber.net.nz/archive/2007/07/10/convert-a-unix-timestamp-to-a-.net-datetime.aspx
        /// </summary>
        /// <param name="timestamp">Timestamp</param>
        /// <returns>DateTime</returns>
        public static DateTime ConvertFromUnixTimestamp(double timestamp)
        {
            var origin = new DateTime(1970, 1, 1, 0, 0, 0, 0);
            return origin.AddSeconds(timestamp);
        }
    }
}