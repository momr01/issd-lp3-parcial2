<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GrillaCobranzas.aspx.cs" Inherits="ABM.GrillaCobranzas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Grilla de Cobranzas</title>
    <style>
        .titulo {
            font-size: 30px;
            font-weight: bold;
         
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
           <div>
            <br />
            <asp:Label ID="Label6" runat="server" Text="GRILLA DE COBRANZAS" CssClass="titulo"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Filtro" Font-Size="Larger"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" Width="248px" DataSourceID="SqlDataSourceClientes" DataTextField="apellido" DataValueField="id" style="margin-top: 0px">
            </asp:DropDownList>
            <asp:Button ID="Filtrar" runat="server" Text="Filtrar" OnClick="Filtrar_Click" />
            <asp:Button ID="QuitarFiltro" runat="server" Text="Quitar Filtro" OnClick="QuitarFiltro_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceCobranzas" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" Width="600px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                    <asp:BoundField DataField="idCliente" HeaderText="idCliente" SortExpression="idCliente" />
                    <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <br />
            <br />
            <br />
            <hr />
            <asp:Label ID="Label2" runat="server" Text="Editar una operación de cobranza" CssClass="titulo"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Fecha: "></asp:Label>
            <asp:TextBox ID="Fecha" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Monto: "></asp:Label>
            <asp:TextBox ID="Monto" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Cliente: "></asp:Label>
            <asp:DropDownList ID="ClientesEditar" runat="server" DataSourceID="SqlDataSourceClientes" DataTextField="apellido" DataValueField="id">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Editar" runat="server" Text="EDITAR" BackColor="#66FFCC" ForeColor="Black" OnClick="Editar_Click" Width="200px" />
            <br />
            <br />
            <asp:Label ID="ResultadoEdicion" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceCobranzas" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [Cobranzas]">
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceClientes" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [Clientes]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Index.aspx">Retornar</asp:HyperLink>
        </div>
    </form>
</body>
</html>
