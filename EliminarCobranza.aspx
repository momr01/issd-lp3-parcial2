<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarCobranza.aspx.cs" Inherits="ABM.EliminarCobranza" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Eliminar Cobranza</title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
             <br />
            <asp:Label ID="Label3" runat="server" Text="ELIMINAR COBRANZA" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
            <br />
             <br />
             <br />
             <asp:Label ID="Label4" runat="server" Text="Consultar cobranza: "></asp:Label><asp:TextBox ID="Id" runat="server"></asp:TextBox>
             <br />
             <br />
             <asp:Button ID="Consultar" runat="server" Text="Consultar" Width="100px" OnClick="Consultar_Click"  />
              <br />
             <br />
             <asp:Label ID="ResultadoConsulta" runat="server" Text=""></asp:Label>
             <br />
             <br />
             <br />
            <hr />
            <br />
            <br />
            <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" BackColor="#00FF99" Width="200px" Visible="False" OnClick="BtnEliminar_Click1"   />
              <br />
            <br />
            <asp:Label ID="ResultadoEliminar" runat="server"></asp:Label>
              <br />
            <br />
              <asp:SqlDataSource ID="SqlDataSourceCobranzas" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM Cobranzas WHERE id = @id" SelectCommand="SELECT co.id as idCobranza, co.fecha as fecha, co.monto as monto, cl.nombre as nombre, cl.apellido as apellido
FROM Cobranzas co
INNER JOIN Clientes cl
ON cl.id = co.idCliente
WHERE co.id = @id">
                  <DeleteParameters>
                      <asp:Parameter Name="id" />
                  </DeleteParameters>
                  <SelectParameters>
                      <asp:Parameter Name="id" />
                  </SelectParameters>
             </asp:SqlDataSource>
              <br />
              <br />
              <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Index.aspx">Retornar</asp:HyperLink>
        </div>
    </form>
</body>
</html>
