<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaCobranza.aspx.cs" Inherits="ABM.AltaCobranza" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alta Cobranza</title>
</head>
<body>
    <form id="form1" runat="server">
          <div>
            <br />
            <asp:Label ID="Label4" runat="server" Text="ALTA DE COBRANZAS" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Ingrese la fecha: "></asp:Label>
            <asp:TextBox ID="Fecha" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <br />
             <asp:Label ID="Label2" runat="server" Text="Ingrese el monto: "></asp:Label>
            <asp:TextBox ID="Monto" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
             <asp:Label ID="Label3" runat="server" Text="Seleccione el cliente: "></asp:Label>
           <asp:DropDownList ID="Cliente" runat="server" DataSourceID="SqlDataSourceClientes" DataTextField="apellido" DataValueField="id"></asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:Button ID="BtnAlta" runat="server" Text="Alta" OnClick="BtnAlta_Click" BackColor="#FFCC66" Width="200px" />
            <br />
            <asp:Label ID="Resultado" runat="server" Text=""></asp:Label>
            <asp:SqlDataSource ID="SqlDataSourceClientes" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT id, nombre, apellido FROM clientes">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCobranzas" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" InsertCommand="INSERT INTO cobranzas(fecha, idCliente, monto) VALUES (@fecha, @idCliente, @monto)" SelectCommand="SELECT * FROM [Cobranzas]" ProviderName="System.Data.SqlClient">
                <InsertParameters>
                    <asp:Parameter Name="fecha" />
                    <asp:Parameter Name="idCliente" />
                    <asp:Parameter Name="monto" />
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
