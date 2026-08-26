using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RompeCabezas.Vista
{
    public partial class Bienvenida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnComenzar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rompecabezas.aspx");
        }
    }
}