<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="clanek-verze.aspx.cs" Inherits="oponent_stav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Článek - starší verze</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Článek - starší verze</h3>

    <div class="obsah">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="zdrojak" DataKeyNames="id_verze" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="id_verze" HeaderText="id_verze" InsertVisible="False" ReadOnly="True" SortExpression="id_verze" Visible="False" />
                <asp:BoundField DataField="cele_jmeno" HeaderText="Autor" SortExpression="cele_jmeno"></asp:BoundField>
                <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku"></asp:BoundField>
                <asp:BoundField DataField="datum_clanku" HeaderText="Verze přidána" SortExpression="datum_clanku"></asp:BoundField>
                  <asp:TemplateField HeaderText="Detail">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-info" Text="Detail" ID="detail_button" runat="server" CausesValidation="false" CommandName="ShowDetail" CommandArgument='<%# Eval("id_verze") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="zdrojak" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Clanek_predchozi_verze].id_verze, ([User].jmeno + ' ' + [User].prijmeni) AS cele_jmeno,[Clanek_predchozi_verze].nadpis_clanku,[Clanek_predchozi_verze].datum_clanku FROM [Clanek_predchozi_verze] JOIN [User] ON Clanek_predchozi_verze.autor = [User].id_user WHERE ([puvodni_clanek]=@puvodni_clanek)">
            <SelectParameters>
                        <asp:QueryStringParameter Name="puvodni_clanek" QueryStringField="clanek" />
                    </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

