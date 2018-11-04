<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zpetna_vazba.aspx.cs" Inherits="zpetna_vazba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Zpetná vazba pro uživatele id:1 (pro test)<br />
            Výběr článku:<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="id_clanek" DataSourceID="zdroj1_zpetna_vazba">
                <Columns>
                    <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                    <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" />
                    <asp:CheckBoxField DataField="ma_oponenta" HeaderText="ma_oponenta" SortExpression="ma_oponenta" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="zdroj1_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM Clanek WHERE id_user=1"></asp:SqlDataSource>
            <br />
            Info o konkrétním článku:<br />
            <asp:GridView ID="GridView2" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
