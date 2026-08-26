using RompeCabezas.Datos;
using RompeCabezas.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RompeCabezas.Logica
{
    public class ProgresoL
    {
        private ProgresoDAO progresoDAO = new ProgresoDAO();

        public void RegistrarCompletado(int tiempoSegundos, string mensaje)
        {
            Progreso progreso = new Progreso();
            progreso.FechaCompletado = DateTime.Now;
            progreso.TiempoSegundos = tiempoSegundos;
            progreso.Mensaje = mensaje;

            progresoDAO.GuardarProgreso(progreso);
        }

        public Progreso ConsultarUltimoProgreso()
        {
            return progresoDAO.ObtenerUltimoProgreso();
        }
    }
}