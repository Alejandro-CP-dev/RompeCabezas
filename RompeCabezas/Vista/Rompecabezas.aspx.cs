using RompeCabezas.Logica;
using RompeCabezas.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RompeCabezas.Vista
{
    public partial class Rompecabezas : System.Web.UI.Page
    {
        ProgresoL progresoL = new ProgresoL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCompletado_Click(object sender, EventArgs e)
        {
            int tiempo = int.Parse(hdnTiempo.Value);
            string mensaje = "Cada pieza que armaste es como cada momento que hemos vivido juntos...";

            progresoL.RegistrarCompletado(tiempo, mensaje);

            Response.Redirect("Sorpresa.aspx");
        }
    }
}