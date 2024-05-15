using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABM
{
    public partial class AltaCobranza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAlta_Click(object sender, EventArgs e)
        {
            if (VerificarCampos())
            {
                InsertarRegistro();
                LimpiarControles();
            }
            else
            {
                this.Resultado.Text = "Por favor verifique los datos ingresados.";
                this.Resultado.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool VerificarCampos()
        {
            if (String.IsNullOrEmpty(this.Fecha.Text) || String.IsNullOrEmpty(this.Monto.Text) || String.IsNullOrEmpty(this.Cliente.SelectedValue))
            {
                return false;
            }
            else if (!decimal.TryParse(this.Monto.Text, out decimal result))
            {
                return false;
            }

            return true;
        }

        private void InsertarRegistro()
        {
            this.SqlDataSourceCobranzas.InsertParameters["fecha"].DefaultValue = this.Fecha.Text;

            this.SqlDataSourceCobranzas.InsertParameters["monto"].DefaultValue = this.Monto.Text;

            this.SqlDataSourceCobranzas.InsertParameters["idCliente"].DefaultValue = this.Cliente.SelectedValue;

            this.SqlDataSourceCobranzas.Insert();
            this.Resultado.Text = "Se efectuó la carga.";
            this.Resultado.ForeColor = System.Drawing.Color.Black;

        }

        private void LimpiarControles()
        {
            this.Fecha.Text = "";
            this.Monto.Text = "";
        }
    }
}