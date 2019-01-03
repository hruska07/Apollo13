<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pridelene-clanky.aspx.cs" Inherits="oponent_stav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Přidělené články</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Přidělené články</h3>

    <div class="obsah">
        <div class="text-center">
            <strong>K recenzi máte přidělené tyto články:<br /><br />
            </strong>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="zdrojak" DataKeyNames="id_clanek" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
                <asp:BoundField DataField="cele_jmeno" HeaderText="Autor" SortExpression="cele_jmeno"></asp:BoundField>
                <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku"></asp:BoundField>
                <asp:BoundField DataField="datum_clanku" HeaderText="Článek přidán" SortExpression="datum_clanku"></asp:BoundField>
                  <asp:TemplateField HeaderText="Detail">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-info" Text="Hodnotit článek" ID="detail_button" runat="server" CausesValidation="false" CommandName="Review" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Operace">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-warning" Text="Předchozí verze" ID="version_button" runat="server" CausesValidation="false" CommandName="Version" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="zdrojak" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Clanek].id_clanek, ([User].jmeno + ' ' + [User].prijmeni) AS cele_jmeno,[Clanek].nadpis_clanku,[Clanek].datum_clanku FROM Propoj_clanek_oponent JOIN [Clanek] ON clanek=id_clanek JOIN [User] ON Clanek.autor = [User].id_user WHERE ([oponent]=@oponent)">
            <SelectParameters>
                        <asp:SessionParameter Name="oponent" SessionField="id_user" Type="Int32" />
                    </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

