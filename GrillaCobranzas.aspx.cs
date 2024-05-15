using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABM
{
    public partial class GrillaCobranzas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Filtrar_Click(object sender, EventArgs e)
        {
            SqlDataSourceCobranzas.FilterExpression = "idCliente = " + DropDownList1.SelectedValue;
        }

        protected void QuitarFiltro_Click(object sender, EventArgs e)
        {
            SqlDataSourceCobranzas.FilterExpression = string.Empty;
            SqlDataSourceCobranzas.FilterParameters.Clear();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ResultadoEdicion.Text = string.Empty;

            Fecha.Text = FormatearFecha(GridView1.SelectedRow.Cells[1].Text);
            Monto.Text = GridView1.SelectedRow.Cells[2].Text;
            ClientesEditar.SelectedValue = GridView1.SelectedRow.Cells[3].Text;

        }

        private string FormatearFecha(string fecha)
        {

            var fechaArreglo = fecha.Split('-');
            string fechaFinal = $"{fechaArreglo[2]}-{fechaArreglo[1]}-{fechaArreglo[0]}";

            return fechaFinal;
        }

        protected void Editar_Click(object sender, EventArgs e)
        {
            if (VerificarCampos())
            {
                EditarCobranza();
                GridView1.SelectedIndex = -1;
                LimpiarControles();

            }

            else
            {

                this.ResultadoEdicion.Text = "Por favor seleccione un registro y verifique que todos los campos estén completados.";
                this.ResultadoEdicion.ForeColor = System.Drawing.Color.Red;
            }


        }

        private void EditarCobranza()
        {
            this.SqlDataSourceCobranzas.UpdateParameters["fecha"].DefaultValue = this.Fecha.Text;
            this.SqlDataSourceCobranzas.UpdateParameters["idCliente"].DefaultValue = this.ClientesEditar.SelectedValue;
            this.SqlDataSourceCobranzas.UpdateParameters["monto"].DefaultValue = this.Monto.Text;
            this.SqlDataSourceCobranzas.UpdateParameters["id"].DefaultValue = GridView1.SelectedRow.Cells[0].Text;

            int cant;
            cant = this.SqlDataSourceCobranzas.Update();
            if (cant == 1) this.ResultadoEdicion.Text = "Se modificó la cobranza";
            else this.ResultadoEdicion.Text = "No fue posible modificar la cobranza";
        }

        private bool VerificarCampos()
        {
            if (GridView1.SelectedRow == null)
            {
                return false;
            }
            else if (this.Fecha.Text == "" || this.Monto.Text == "")
            {
                return false;
            }

            return true;
        }

        private void LimpiarControles()
        {
            this.Fecha.Text = string.Empty;
            this.Monto.Text = string.Empty;
        }
    }
}