<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sprava-casopisu.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Správa časopisů</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Správa časopisů</h3>
    <div class="obsah">
        <h4>
            <asp:label id="Label_oznaceni" runat="server" text="Label"></asp:label>
        </h4>

        <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" datakeynames="id_clanek" datasourceid="SqlDataSource1" onrowcommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" ReadOnly="True" SortExpression="id_clanek" InsertVisible="False" Visible="False" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="Článek" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="datum_clanku" HeaderText="Datum vložení" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav" SortExpression="nazev_stav_cit" />
                    <asp:BoundField DataField="cele_jmeno" HeaderText="Autor" ReadOnly="True" SortExpression="cele_jmeno" />
                    <asp:TemplateField HeaderText="Soubor">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-info" Text="Stáhnout" ID="detail_button" runat="server" CausesValidation="false" CommandName="ShowDetail" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:gridview>
        <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" selectcommand="SELECT [Clanek].*, Stav.nazev_stav_cit, ([User].[jmeno] +' '+ [User].[prijmeni]) AS [cele_jmeno] FROM [Clanek] JOIN [User] ON [Clanek].[autor] = [User].[id_user] JOIN [Stav] ON [Clanek].[stav] = [Stav].[id_stav] WHERE Clanek.casopis = @casopis">
                <SelectParameters>
                    <asp:QueryStringParameter Name="casopis" QueryStringField="casopis" />
                </SelectParameters>
        </asp:sqldatasource>
    </div>

</asp:Content>

