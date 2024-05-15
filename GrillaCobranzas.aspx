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
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSourceCobranzas" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" Width="722px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="620px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" DataFormatString="{0:dd-MM-yyyy}" ReadOnly="True" />
                    <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" />
                    <asp:BoundField DataField="IdCliente" HeaderText="IdCliente" SortExpression="IdCliente" />
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" ReadOnly="True" SortExpression="Cliente" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/assets/icon-select.png" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSourceCobranzas" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM [Cobranzas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cobranzas] ([fecha], [idCliente], [monto]) VALUES (@fecha, @idCliente, @monto)" SelectCommand="SELECT co.id AS Id, CAST(co.fecha AS DATE) AS Fecha, co.monto AS Monto, co.idCliente AS IdCliente, CONCAT(cl.nombre, ' ', cl.apellido) AS Cliente
FROM Cobranzas co
INNER JOIN Clientes cl
ON co.idCliente = cl.id
" UpdateCommand="UPDATE [Cobranzas] SET [fecha] = @fecha, [idCliente] = @idCliente, [monto] = @monto WHERE [id] = @id">
                <InsertParameters>
                    <asp:Parameter Name="fecha" />
                    <asp:Parameter Name="idCliente" />
                    <asp:Parameter Name="monto" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fecha" />
                    <asp:Parameter Name="idCliente" />
                    <asp:Parameter Name="monto" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceClientes" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT id, apellido, nombre FROM clientes"></asp:SqlDataSource>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Index.aspx">Retornar</asp:HyperLink>
        </div>
    </form>
</body>
</html>
