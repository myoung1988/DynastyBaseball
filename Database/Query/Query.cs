using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;

namespace Dynasty.Database
{
    public class Query
    {

        #region Property

        public string Sql;
        public List<Parameter> ParameterList;

        #endregion

        #region Constructors

        /// <summary>
        /// Intializes the Default Constructor
        /// </summary>
        public Query() { Intialize(); }

        /// <summary>
        /// Intializes the Constructor and sets the default Sql String from the passed in parameter
        /// </summary>
        /// <para>sDefaultSQL - The default SQL string to be ran if the database is unknown or not set</para>
        public Query(string sDefaultSQL)
        {
            Intialize();
            Sql = sDefaultSQL;
        }

        #endregion

        #region Methods

        /// <summary>
        /// Intializes the constructors
        /// </summary>
        private void Intialize()
        {
            ParameterList = new List<Parameter>();
            Sql = string.Empty;
            
            ParameterList.Clear();
        }

        /// <summary>
        /// Sets and returns the Parameter object
        /// </summary>
        /// <para>pName - Name of the Parameter</para>
        /// <para>pValue - Value of the Parameter</para>
        /// <para>pType - Type of the value being entered in the query</para>
        /// <returns>Parameter - Returns a Parameter object that can be added to the Query Object</returns>
        public Parameter get_Parameter(string pName, string pValue, OleDbType pType)
        {
            Parameter oParm = new Parameter(pName, pValue, pType);
            return oParm;
        }

        /// <summary>
        /// Adds the parameter to the parameter list of the query object
        /// </summary>
        /// <para>pName - Name of the Parameter</para>
        /// <para>pValue - Value of the Parameter</para>
        /// <para>pType - Type of the value being entered in the query</para>
        public void Add_Parameter(string pName, string pValue, OleDbType pType)
        {
            Parameter oParm = new Parameter(pName, pValue, pType);
            ParameterList.Add(oParm);
        }

        #endregion

    }
}
