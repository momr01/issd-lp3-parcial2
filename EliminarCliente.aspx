<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarCliente.aspx.cs" Inherits="ABM.EliminarCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Eliminar Cliente</title>
</head>
<body>
    <form id="form1" runat="server">
            <div>
             <br />
            <asp:Label ID="Label3" runat="server" Text="ELIMINAR CLIENTE" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
            <br />
             <br />
             <br />
             <asp:Label ID="Label4" runat="server" Text="Consultar cliente: "></asp:Label><asp:TextBox ID="Id" runat="server"></asp:TextBox>
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
            <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" BackColor="#00FF99" Width="200px" Visible="False" OnClick="BtnEliminar_Click"  />
              <br />
            <br />
            <asp:Label ID="ResultadoEliminar" runat="server"></asp:Label>
              <br />
            <asp:SqlDataSource ID="SqlDataSourceClientes" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT id, nombre, apellido FROM Clientes WHERE id = @id" UpdateCommand="UPDATE Clientes SET nombre=@nombre, apellido=@apellido
WHERE id=@id" DeleteCommand="DELETE FROM Clientes WHERE id = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:Parameter Name="id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" />
                    <asp:Parameter Name="apellido" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
              <br />
              <br />
              <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Index.aspx">Retornar</asp:HyperLink>
        </div>
    </form>
</body>
</html>
