using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;

namespace Dynasty.Database
{
    public class Parameter
    {

        #region Variables

        private string pName;
        private string pValue;
        private OleDbType pType;

        #endregion

        #region Property

        public string Name { get { return pName; } set { pName = value; } }
        public string Value { get { return pValue; } set { pValue = value; } }
        public OleDbType Type { get { return pType; } set { pType = value; } }

        #endregion

        #region Constructors

        /// <summary>
        /// Default Constructor for the Parameter
        /// </summary>
        public Parameter() { }

        /// <summary>
        /// Constructor that initilizes the parameter
        /// </summary>
        /// <para>Name - Name of the variable</para>
        /// <para>Value - Value being assigned</para>
        /// <para>Type - Type of Value being used</para>
        public Parameter(string pName, string pValue, OleDbType pType)
        {
            Name = pName;
            Value = pValue;
            Type = pType;
        }

        #endregion

        #region Methods

        /// <summary>
        /// Sets the parameter fields
        /// </summary>
        /// <para>Name - Name of the variable</para>
        /// <para>Value - Value being assigned</para>
        /// <para>Type - Type of Value being used</para>
        public void Set_Parameter(string pName, string pValue, OleDbType pType)
        {
            Name = pName;
            Value = pValue;
            Type = pType;
        }

        /// <summary>
        /// Restores the Parameter to the default settings.
        /// </summary>
        public void Clear()
        {
            Name = string.Empty;
            Value = string.Empty;
            Type = OleDbType.VarChar;
        }

        #endregion

    }
}
