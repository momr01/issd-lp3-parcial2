using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABM
{
    public partial class EliminarCobranza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Consultar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {
                BuscarCobranza();
            }
            else
            {
                this.ResultadoConsulta.Text = "Por favor ingrese el Id de la cobranza que desea eliminar.";
                this.ResultadoConsulta.ForeColor = System.Drawing.Color.Red;
                this.ResultadoEliminar.Text = string.Empty;
            }
        }

        private void BuscarCobranza()
        {
            this.ResultadoConsulta.Text = string.Empty;
            this.ResultadoEliminar.Text = string.Empty;

            this.SqlDataSourceCobranzas.SelectParameters["id"].DefaultValue = this.Id.Text;
            this.SqlDataSourceCobranzas.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSourceCobranzas.Select(DataSourceSelectArguments.Empty);

            if (registros.Read())
            {
                this.ResultadoConsulta.Text = $"Usted desea eliminar la cobranza con Id número {registros["idCobranza"]}, realizada " +
                    $"el día {registros["fecha"]}, por un importe de $ {registros["monto"]}, efectuada por el cliente {registros["nombre"].ToString().ToUpper()} {registros["apellido"].ToString().ToUpper()}.";
                this.ResultadoConsulta.ForeColor = System.Drawing.Color.BlueViolet;
                BtnEliminar.Visible = true;
            }
            else
            {
                this.ResultadoConsulta.Text = "No existe una cobranza con dicho ID.";
                this.ResultadoConsulta.ForeColor = System.Drawing.Color.Red;
                BtnEliminar.Visible = false;
                LimpiarControles();
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


        private void Eliminar()
        {
            try
            {
                this.SqlDataSourceCobranzas.DeleteParameters["id"].DefaultValue = this.Id.Text;

                int cant;
                cant = this.SqlDataSourceCobranzas.Delete();
                if (cant == 1)
                {
                    this.ResultadoEliminar.Text = "Se borró la cobranza exitosamente.";
                    this.ResultadoEliminar.ForeColor = System.Drawing.Color.Blue;
                }

                else
                {
                    this.ResultadoEliminar.Text = "No fue posible borrar la cobranza.";
                    this.ResultadoEliminar.ForeColor = System.Drawing.Color.Black;
                }
            } catch
            {
                this.ResultadoEliminar.Text = "No fue posible borrar la cobranza.";
                this.ResultadoEliminar.ForeColor = System.Drawing.Color.Black;
            }
           

        }

        protected void BtnEliminar_Click1(object sender, EventArgs e)
        {
            Eliminar();
            this.Id.Text = string.Empty;
            this.ResultadoConsulta.Text = string.Empty;
            BtnEliminar.Visible = false;
        }
    }
}