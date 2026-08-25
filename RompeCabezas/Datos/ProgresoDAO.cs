using RompeCabezas.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;

namespace RompeCabezas.Datos
{
    public class ProgresoDAO
    {
        private readonly ConexionDB conexionDB;

        public void GuardarProgreso(Progreso progreso)
        {
            using (SqlConnection conn = conexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"insert into Progreso
                              (FechaCompletado, TiempoSegundos, Mensaje) 
                               VALUES
                              (@fecha, @tiempo, @mensaje)";


                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@fecha", progreso.FechaCompletado);
                cmd.Parameters.AddWithValue("@tiempo", progreso.TiempoSegundos);
                cmd.Parameters.AddWithValue("@mensaje", progreso.Mensaje);
                cmd.ExecuteNonQuery();
            }

        }

        public Progreso ObtenerUltimoProgreso()
        {
            Progreso progreso = null;

            using (SqlConnection conn = conexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"select top 1
                                    Id,
                                    FechaCompletado,
                                    TiempoSegundos,
                                    Mensaje
                                    from Progreso
                                    order by Id desc";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    progreso = new Progreso()
                    {
                        Id = (int)dr["Id"],
                        FechaCompletado = (DateTime)dr["FechaCompletado"],
                        TiempoSegundos = (int)dr["TiempoSegundos"],
                        Mensaje = dr["Mensaje"].ToString()
                    };
                }

                return progreso;
            }
        }
    }
}