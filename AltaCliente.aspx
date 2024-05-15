<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaCliente.aspx.cs" Inherits="ABM.AltaCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alta Cliente</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Label ID="Label3" runat="server" Text="ALTA DE CLIENTES" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Ingrese nombre: "></asp:Label>
            <asp:TextBox ID="Nombre" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
             <asp:Label ID="Label2" runat="server" Text="Ingrese apellido: "></asp:Label>
            <asp:TextBox ID="Apellido" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="BtnAlta" runat="server" Text="Alta" OnClick="BtnAlta_Click" BackColor="#00FF99" Width="200px" />
            <br />
            <asp:Label ID="Resultado" runat="server" Text=""></asp:Label>
            <asp:SqlDataSource ID="SqlDataSourceClientes" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" InsertCommand="INSERT INTO clientes(apellido, nombre) VALUES (@apellido, @nombre)" ProviderName="<%$ ConnectionStrings:IssdTP42023ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Clientes]">
                <InsertParameters>
                    <asp:Parameter Name="apellido" />
                    <asp:Parameter Name="nombre" />
                </InsertParameters>
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
