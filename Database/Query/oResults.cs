using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Dynasty.Database
{
    public class Results
    {

        #region Property

        public int Rows_Affected;
        public Exception SqlException;
        public string SqlString;
        public DataTable Table;

        #endregion

        #region Methods

        /// <summary>
        /// Constructor for the Results Object
        /// </summary>
        public Results()
        {
            Rows_Affected = 0;
            SqlException = null;
            SqlString = string.Empty;
            Table = new DataTable();
        }

        #endregion

    }
}
