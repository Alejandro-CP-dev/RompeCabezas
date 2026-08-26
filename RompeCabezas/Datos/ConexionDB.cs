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
       private static readonly string connexion = ConfigurationManager.ConnectionStrings["dbConexion"].ConnectionString;

        public static SqlConnection MtAbrirConexion()
        {
            if (string.IsNullOrEmpty(connexion))
            {
                throw new Exception("No se encontró la cadena de conexión 'conexionBD' en el Web.config.");
            }

            return new SqlConnection(connexion);
        }
    }
}