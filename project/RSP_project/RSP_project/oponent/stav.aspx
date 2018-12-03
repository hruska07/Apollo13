<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="stav.aspx.cs" Inherits="oponent_stav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_propoj,id_clanek" DataSourceID="zdroj_oponent_stav" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:BoundField DataField="Id_propoj" HeaderText="Id_propoj" InsertVisible="False" ReadOnly="True" SortExpression="Id_propoj" Visible="False" />
            <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" Visible="False" />
            <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
            <asp:BoundField DataField="datum_vyrizeni" HeaderText="datum_vyrizeni" SortExpression="datum_vyrizeni" />
            <asp:BoundField DataField="prideleno" HeaderText="prideleno" SortExpression="prideleno" Visible="False" />
            <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
            <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
            <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
            <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
            <asp:BoundField DataField="stav" HeaderText="stav" SortExpression="stav" />
            <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" />
            <asp:BoundField DataField="soubor" HeaderText="soubor" SortExpression="soubor" />
            <asp:BoundField DataField="abstrakt" HeaderText="abstrakt" SortExpression="abstrakt" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="zdroj_oponent_stav" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM Propoj_clanek_oponent JOIN Clanek ON clanek=id_clanek WHERE ([oponent]=@oponent)">
        <SelectParameters>
            <asp:SessionParameter Name="oponent" SessionField="id_user" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <p>
    </p>
</asp:Content>

