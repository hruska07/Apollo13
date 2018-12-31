<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="terminy-oponenti.aspx.cs" Inherits="redaktor_terminy_oponenti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   <div class="obsah">  <div class="text-center">
            <strong>Vyberte oponenta:<br /><br />
            </strong>
        </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="zdroj_oponenti">
        <Columns>
            <asp:TemplateField HeaderText="Operace">
                   <ItemTemplate>
                        <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
            <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno oponenta" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení oponenta" SortExpression="prijmeni" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="zdroj_oponenti" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" OnSelecting="zdroj_oponenti_Selecting" SelectCommand="SELECT DISTINCT [Propoj_clanek_oponent].oponent,[User].id_user,[User].jmeno,[User].prijmeni FROM [User] JOIN [Propoj_clanek_oponent] ON id_user=oponent "></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="zdrojak2">
        <Columns>
            <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
            <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení autora" SortExpression="prijmeni" />
            <asp:BoundField DataField="datum_vyrizeni" HeaderText="Datum vyřízení posudku" SortExpression="datum_vyrizeni" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="zdrojak2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Propoj_clanek_oponent].oponent,[Clanek].nadpis_clanku,[User].jmeno,[User].prijmeni,[Propoj_clanek_oponent].datum_vyrizeni FROM [Propoj_clanek_oponent] JOIN [Clanek] ON [Propoj_clanek_oponent].clanek=[Clanek].id_clanek JOIN [User] ON [Clanek].autor=[User].id_user WHERE ([Propoj_clanek_oponent].oponent=@oponent) ">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="oponent" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource></div>
</asp:Content>

