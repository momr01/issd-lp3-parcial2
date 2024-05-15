using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABM
{
    public partial class AltaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAlta_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {
                AgregarCliente();
                LimpiarControles();
            }
            else
            {
                this.Resultado.Text = "Debe completar todos los campos para insertar un nuevo cliente.";
                this.Resultado.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void AgregarCliente()
        {
            this.SqlDataSourceClientes.InsertParameters["apellido"].DefaultValue = this.Apellido.Text;

            this.SqlDataSourceClientes.InsertParameters["nombre"].DefaultValue = this.Nombre.Text;

            this.SqlDataSourceClientes.Insert();

            this.Resultado.Text = "Se efectuó la carga correctamente.";
            this.Resultado.ForeColor = System.Drawing.Color.Black;
        }

        private void LimpiarControles()
        {
            this.Apellido.Text = "";
            this.Nombre.Text = "";
        }

        private bool ValidarCampos()
        {
            if (String.IsNullOrEmpty(this.Apellido.Text) || String.IsNullOrEmpty(this.Nombre.Text)) { return false; }

            return true;
        }
    }
}