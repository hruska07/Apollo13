<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="agenda-oponenti.aspx.cs" Inherits="sefredaktor_agenda_oponenti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="SqlDataSource1zdrojik">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" />
            <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" />
            <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1zdrojik" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT DISTINCT [Propoj_clanek_oponent].oponent,[User].id_user,[User].jmeno,[User].prijmeni FROM [User] JOIN [Propoj_clanek_oponent] ON id_user=oponent"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="SqlDataSource1sss" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
            <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
            <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
            <asp:BoundField DataField="datum_vyrizeni" HeaderText="datum_vyrizeni" SortExpression="datum_vyrizeni" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1sss" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Clanek].id_clanek,[Clanek].nadpis_clanku,[User].jmeno,[User].prijmeni,[Propoj_clanek_oponent].datum_vyrizeni FROM [Propoj_clanek_oponent] JOIN [Clanek] ON [Propoj_clanek_oponent].clanek=[Clanek].id_clanek JOIN [User] ON [Clanek].autor=[User].id_user WHERE ([Propoj_clanek_oponent].oponent=@oponent)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="oponent" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" ClientIDMode="Predictable" Height="160px" ReadOnly="True" TextMode="MultiLine" Visible="False" Width="100%"></asp:TextBox>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" Runat="Server">
</asp:Content>

