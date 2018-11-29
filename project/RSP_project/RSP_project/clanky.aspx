<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="clanky.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Články</h3>
    <div class="obsah">
        <asp:Panel ID="Panel_prehled" runat="server">
            <asp:GridView CssClass="table table-dark table-striped table-borderless" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="SqlDataSource1" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id_clanek" HeaderText="ID článku" ReadOnly="True" SortExpression="id_clanek" Visible="False" HeaderStyle-CssClass="my-link text-center"/>
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="Název článku" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="datum_clanku" HeaderText="Datum přidání" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="cele_jmeno" HeaderText="Autor" SortExpression="autor" />
                    <asp:TemplateField HeaderText="Detail">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-danger" Text="Detail" ID="select_button" runat="server" CommandName="Select" />
                            <HeaderStyle CssClass="my-link" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle cssClass="bg-dark text-center" /> 
                <SortedAscendingHeaderStyle CssClass="bg-dark"/>
                <SortedDescendingHeaderStyle CssClass="table-dark"/>
                <HeaderStyle CssClass="text-center my-link" />
                <RowStyle CssClass="text-center" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Clanek].*, ([User].[jmeno] +' '+ [User].[prijmeni]) AS [cele_jmeno] FROM [Clanek] JOIN [User] ON [Clanek].[autor] = [User].[id_user] JOIN [Stav] ON [Clanek].[stav] = [Stav].[id_stav] WHERE [Stav].[nazev_stav] = 'zverejnen'"></asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel_detail" runat="server">
                <div class="card-body mt-0 py-0 pl-1">
                    <h5 class="card-title mt-1">
                        <asp:Label ID="Label_nadpis" runat="server" Text="Label"></asp:Label>
                    </h5>
                    <h6 class="card-subtitle mb-2">
                        <span class="fa fa-calendar"></span> <asp:Label ID="Label_datum" runat="server" Text="Label"></asp:Label>
                    </h6>
                    <p class="card-text pt-2">
                        <asp:Label ID="Label_abstrakt" runat="server" Text="Label"></asp:Label>
                    </p>
                    <asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Soubor" OnClick="Button1_Click" />
         
                    &nbsp;<footer class="blockquote-footer mt-1 " style="color: #fff;">
                        <asp:Label ID="Label_autor" runat="server" Text="Label"></asp:Label>
                    </footer>
                </div>
        </asp:Panel>
    </div>

</asp:Content>

