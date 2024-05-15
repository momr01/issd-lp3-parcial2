using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABM
{
    public partial class ModificarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Modificar()
        {
            this.SqlDataSourceClientes.UpdateParameters["nombre"].DefaultValue = this.Nombre.Text;
            this.SqlDataSourceClientes.UpdateParameters["apellido"].DefaultValue = this.Apellido.Text;
            this.SqlDataSourceClientes.UpdateParameters["id"].DefaultValue = this.Id.Text;

            int cant;
            cant = this.SqlDataSourceClientes.Update();
            if (cant == 1)
            {
                this.ResultadoUpdate.ForeColor = System.Drawing.Color.Black;
                this.ResultadoUpdate.Text = "Se modifico el cliente.";
                LimpiarControles();


            }

            else
            {
                this.ResultadoUpdate.ForeColor = System.Drawing.Color.Red;
                this.ResultadoUpdate.Text = "No existe el codigo.";
            }


        }

        private void BuscarCliente()
        {
            this.ResultadoConsulta.Text = string.Empty;
            this.ResultadoUpdate.Text = string.Empty;

            this.SqlDataSourceClientes.SelectParameters["id"].DefaultValue = this.Id.Text;
            this.SqlDataSourceClientes.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSourceClientes.Select(DataSourceSelectArguments.Empty);

            if (registros.Read())
            {
                this.Nombre.Text = registros["nombre"].ToString();
                this.Apellido.Text = registros["apellido"].ToString();
                this.ResultadoConsulta.Text = string.Empty;
                this.ResultadoUpdate.Text = string.Empty;
            }
            else
            {
                this.ResultadoConsulta.Text = "No existe un cliente con dicho ID.";
                this.ResultadoConsulta.ForeColor = System.Drawing.Color.Red;
                LimpiarControles();
            }

        }

        protected void Consultar_Click(object sender, EventArgs e)
        {
            this.ResultadoConsulta.Text = string.Empty;
            this.ResultadoUpdate.Text = string.Empty;

            if (String.IsNullOrEmpty(this.Id.Text))
            {
                this.ResultadoConsulta.Text = "Debe ingresar un Id válido para modificar un cliente";
                this.ResultadoConsulta.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                BuscarCliente();
            }

        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {
                Modificar();
            }
            else
            {
                this.ResultadoUpdate.Text = "Debe completar todos los campos para modificar un cliente.";
                this.ResultadoUpdate.ForeColor = System.Drawing.Color.Red;
            }

        }

        private void LimpiarControles()
        {
            this.Id.Text = string.Empty;
            this.Nombre.Text = string.Empty;
            this.Apellido.Text = string.Empty;
        }

        private bool ValidarCampos()
        {
            if (String.IsNullOrEmpty(this.Nombre.Text) || String.IsNullOrEmpty(this.Apellido.Text) || String.IsNullOrEmpty(this.Id.Text))
            {
                return false;
            }
            return true;
        }
    }
}