using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABM
{
    public partial class EliminarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void BuscarCliente()
        {
            this.ResultadoConsulta.Text = string.Empty;
            this.ResultadoEliminar.Text = string.Empty;

            this.SqlDataSourceClientes.SelectParameters["id"].DefaultValue = this.Id.Text;
            this.SqlDataSourceClientes.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSourceClientes.Select(DataSourceSelectArguments.Empty);

            if (registros.Read())
            {
                this.ResultadoConsulta.Text = $"Usted desea eliminar el cliente {registros["nombre"].ToString().ToUpper()} {registros["apellido"].ToString().ToUpper()}, con Id número {registros["id"]}.";
                this.ResultadoConsulta.ForeColor = System.Drawing.Color.BlueViolet;
                BtnEliminar.Visible = true;
            }
            else
            {
                this.ResultadoConsulta.Text = "No existe un cliente con dicho ID.";
                this.ResultadoConsulta.ForeColor = System.Drawing.Color.Red;
                BtnEliminar.Visible = false;
                LimpiarControles();
            }

        }

        protected void Consultar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {
                BuscarCliente();
            }
            else
            {
                this.ResultadoConsulta.Text = "Por favor ingrese el Id del cliente que desea eliminar.";
                this.ResultadoConsulta.ForeColor = System.Drawing.Color.Red;

                this.ResultadoEliminar.Text = string.Empty;
            }
        }

        private void LimpiarControles()
        {
            this.Id.Text = string.Empty;
        }

        private bool ValidarCampos()
        {
            if (String.IsNullOrEmpty(this.Id.Text))
            {
                return false;
            }

            return true;
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            Eliminar();
            this.Id.Text = string.Empty;
            this.ResultadoConsulta.Text = string.Empty;
            BtnEliminar.Visible = false;
        }

        private void Eliminar()
        {
            this.SqlDataSourceClientes.DeleteParameters["id"].DefaultValue = this.Id.Text;

            int cant;
            cant = this.SqlDataSourceClientes.Delete();
            if (cant == 1)
            {
                this.ResultadoEliminar.Text = "Se borró el cliente exitosamente.";
                this.ResultadoEliminar.ForeColor = System.Drawing.Color.Blue;
            }

            else
            {
                this.ResultadoEliminar.Text = "No fue posible borrar el cliente.";
                this.ResultadoEliminar.ForeColor = System.Drawing.Color.Black;
            }

        }
    }
}