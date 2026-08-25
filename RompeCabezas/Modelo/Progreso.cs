using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RompeCabezas.Modelo
{
    public class Progreso
    {
        public int Id { get; set; }
        public DateTime FechaCompletado { get; set; }
        public int TiempoSegundos { get; set; }
        public string Mensaje { get; set; }
    }
}