using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RompeCabezas.Datos
{
    public class ConexionDB
    {
        private readonly string connexion = ConfigurationManager.ConnectionStrings["dbConexion"].ConnectionString;

        public SqlConnection MtAbrirConexion()
        {
            return new SqlConnection(connexion);
        }
    }
}