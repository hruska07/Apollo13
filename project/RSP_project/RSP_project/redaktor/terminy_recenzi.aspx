<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="terminy_recenzi.aspx.cs" Inherits="redaktor_terminy_recenzi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Termíny recenzí</h3>
     <div class="obsah">
        <div class="text-center">
              <strong>Vyberte z autora:<br /><br />
            </strong>
        </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="zdroj1">
        <Columns>
            <asp:TemplateField HeaderText="Operace">
                   <ItemTemplate>
                        <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                    </ItemTemplate>


            </asp:TemplateField>
            <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení autora" SortExpression="prijmeni" />
            <asp:BoundField DataField="login" HeaderText="Login autora" SortExpression="login" />
            <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="zdroj1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_user], [jmeno], [prijmeni], [login], [role] FROM [User] WHERE ([role] = @role)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="role" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
            <div class="text-center">
                <strong>Články autora:<br /><br />
            </strong>
        </div>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_posudek,id_clanek" DataSourceID="zdroj2">
        <Columns>
            <asp:BoundField DataField="id_posudek" HeaderText="id_posudek" InsertVisible="False" ReadOnly="True" SortExpression="id_posudek" Visible="False" />
            <asp:BoundField DataField="obsah_posudku" HeaderText="obsah_posudku" SortExpression="obsah_posudku" Visible="False" />
            <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku" />
            <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
            <asp:BoundField DataField="datum_posudku" HeaderText="Termín posudku" SortExpression="datum_posudku" />
            <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" Visible="False" />
            <asp:CheckBoxField DataField="zpristupnen" HeaderText="zpristupnen" SortExpression="zpristupnen" Visible="False" />
            <asp:BoundField DataField="komentar" HeaderText="komentar" SortExpression="komentar" Visible="False" />
            <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
            <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" Visible="False" />
            <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" Visible="False" />
            <asp:BoundField DataField="stav" HeaderText="stav" SortExpression="stav" Visible="False" />
            <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" Visible="False" />
            <asp:BoundField DataField="soubor" HeaderText="soubor" SortExpression="soubor" Visible="False" />
            <asp:BoundField DataField="abstrakt" HeaderText="abstrakt" SortExpression="abstrakt" Visible="False" />
            <asp:BoundField DataField="keywords" HeaderText="keywords" SortExpression="keywords" Visible="False" />
            <asp:BoundField DataField="autors" HeaderText="autors" SortExpression="autors" Visible="False" />
            <asp:BoundField DataField="workplace" HeaderText="workplace" SortExpression="workplace" Visible="False" />
            <asp:BoundField DataField="path" HeaderText="path" SortExpression="path" Visible="False" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="zdroj2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Posudek] JOIN [Clanek] ON [Posudek].Clanek=[Clanek].id_clanek WHERE [Clanek].autor=@autor">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="autor" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
         </div>
</asp:Content>


