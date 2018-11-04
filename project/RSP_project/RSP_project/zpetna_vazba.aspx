<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zpetna_vazba.aspx.cs" Inherits="zpetna_vazba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <div class="auto-style1">
                Vaše všechny odeslané aktuální články: [pro uživatele id:1 (pro test)]<br />
                <br />
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_clanek" DataSourceID="zdroj3_zpetna_vazba" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                        <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                        <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
                        <asp:CheckBoxField DataField="ma_oponenta" HeaderText="ma_oponenta" SortExpression="ma_oponenta" />
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
                <asp:SqlDataSource ID="zdroj3_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM Clanek WHERE autor=1"></asp:SqlDataSource>
                <br />
                <br />
                Články ke kterým je dostupný <strong>posudek</strong>:<br />
            <br />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="id_clanek" DataSourceID="zdroj1_zpetna_vazba" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                    <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
                    <asp:CheckBoxField DataField="ma_oponenta" HeaderText="ma_oponenta" SortExpression="ma_oponenta" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#FF9B82" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="zdroj1_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM Posudek JOIN Clanek ON clanek=id_clanek WHERE autor=1"></asp:SqlDataSource>
            <div class="auto-style1">
            <br />
                <br />
                Info o konkrétním posudku (zobrazí se po vybrání výše): <br />
            </div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_posudek" DataSourceID="zdroj2_zpetna_vazba" HorizontalAlign="Center" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="id_posudek" HeaderText="id_posudek" ReadOnly="True" SortExpression="id_posudek" />
                    <asp:BoundField DataField="obsah_posudku" HeaderText="obsah_posudku" SortExpression="obsah_posudku" />
                    <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" />
                    <asp:BoundField DataField="datum_posudku" HeaderText="datum_posudku" SortExpression="datum_posudku" />
                    <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="zdroj2_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Posudek] WHERE ([clanek] = @clanek)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="clanek" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
