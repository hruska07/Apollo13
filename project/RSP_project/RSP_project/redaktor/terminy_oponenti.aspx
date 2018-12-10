<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="terminy_oponenti.aspx.cs" Inherits="redaktor_terminy_oponenti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_propoj" DataSourceID="zdroj_oponenti">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" />
            <asp:BoundField DataField="id_propoj" HeaderText="id_propoj" InsertVisible="False" ReadOnly="True" SortExpression="id_propoj" Visible="False" />
            <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="zdroj_oponenti" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" OnSelecting="zdroj_oponenti_Selecting" SelectCommand="SELECT DISTINCT [Propoj_clanek_oponent].oponent,[Propoj_clanek_oponent].id_propoj,[User].jmeno,[User].prijmeni FROM [Propoj_clanek_oponent] JOIN [User] ON oponent=id_user "></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="zdrojak2">
        <Columns>
            <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" />
            <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
            <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
            <asp:BoundField DataField="datum_vyrizeni" HeaderText="datum_vyrizeni" SortExpression="datum_vyrizeni" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="zdrojak2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Propoj_clanek_oponent].oponent,[Clanek].nadpis_clanku,[User].jmeno,[User].prijmeni,[Propoj_clanek_oponent].datum_vyrizeni FROM [Propoj_clanek_oponent] JOIN [Clanek] ON [Propoj_clanek_oponent].clanek=[Clanek].id_clanek JOIN [User] ON [Clanek].autor=[User].id_user WHERE ([Propoj_clanek_oponent].oponent=@oponent) ">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="oponent" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

