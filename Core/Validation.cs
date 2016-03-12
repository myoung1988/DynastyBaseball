using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dynasty.Core
{
    public static class Validation
    {
        public static void ThrowIfNull(object toCheck, string paramName)
        {
            if (null == toCheck) throw new ArgumentNullException(paramName, $"{paramName} cannot be null");
        }

        public static void ThrowIfNullOrEmpty(string toCheck, string paramName)
        {
            if (string.IsNullOrEmpty(toCheck)) throw new ArgumentNullException(paramName, $"{paramName} cannot be null or empty");
        }

        public static void ThrowIfLessThan(int toCheck, int lessThan, string paramName)
        {
            if (toCheck < lessThan) throw new ArgumentOutOfRangeException(paramName, $"{paramName} cannot be less than {lessThan}");
        }
    }
}
