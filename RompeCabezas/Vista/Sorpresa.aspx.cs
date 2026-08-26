using RompeCabezas.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RompeCabezas.Vista
{
    public partial class Sorpresa : System.Web.UI.Page
    {
        private ProgresoL progresoBL = new ProgresoL();

        protected void Page_Load(object sender, EventArgs e)
        {
            var progreso = progresoBL.ConsultarUltimoProgreso();
            if (progreso != null)
            {
                lblMensaje.Text = progreso.Mensaje;
            }
        }
    }
}