<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ABM.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ABM Cobranzas Clientes</title>
    <style>
        .opciones {
            margin-left: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Overline="True" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="True" Text="ADMINISTRACIÓN COBRANZAS - CLIENTES"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="CLIENTES" ViewStateMode="Enabled"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AltaCliente.aspx" CssClass="opciones">Alta de clientes</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="opciones" NavigateUrl="~/ModificarCliente.aspx">Modificar Cliente
            </asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="opciones" NavigateUrl="~/EliminarCliente.aspx">Eliminar cliente</asp:HyperLink>
            <br />
             <br />
             <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Text="COBRANZAS"></asp:Label>
            <br />
            <br />
             <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/GrillaCobranzas.aspx" CssClass="opciones">Grilla de Cobranzas</asp:HyperLink>
            <br />
             <br />
             <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AltaCobranza.aspx" CssClass="opciones">Alta de cobranzas</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="opciones" NavigateUrl="~/GrillaCobranzas.aspx">Modificar cobranza</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink7" runat="server" CssClass="opciones" NavigateUrl="~/EliminarCobranza.aspx">Eliminar cobranza</asp:HyperLink>
            <br />
             <br />
             <br />
            <br />
             <br />
             <br />
            <br />
             <br />
             <br />

        </div>
    </form>
</body>
</html>
