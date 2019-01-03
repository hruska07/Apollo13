<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sprava-casopisu-otevrene.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Správa časopisů</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 class="text-center">Správa časopisů</h3>

    <div class="obsah">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="#">Otevřené časopisy</a>
            </li>
            <li class="nav-item">
                <a class="nav-link bg-dark text-white" href="/sefredaktor/sprava-casopisu-uzavrene">Uzavřené časopisy</a>
            </li>
        </ul>

        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="id_casopis" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
                <asp:BoundField DataField="oznaceni" HeaderText="Vydání" SortExpression="oznaceni" />
                <asp:BoundField DataField="Tema" HeaderText="Kategorie" SortExpression="Tema" />
                <asp:BoundField DataField="datum_uzaverky" HeaderText="Datum uzávěrky" SortExpression="datum_uzaverky" />
                <asp:BoundField DataField="kapacita" HeaderText="Kapacita" SortExpression="kapacita" />
                <asp:BoundField DataField="pocet_clanku" HeaderText="Počet článků" ReadOnly="True" SortExpression="pocet_clanku" />
                <asp:TemplateField HeaderText="Operace">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-info" Text="Správa článků" ID="detail_button" runat="server" CausesValidation="false" CommandName="Sprava" CommandArgument='<%# Eval("id_casopis") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT Casopis.id_casopis, Casopis.oznaceni, [Casopis].[Tema], [Casopis].[datum_uzaverky], [Casopis].[kapacita], (SELECT COUNT(*) FROM [Clanek] WHERE [Clanek].[casopis] = [Casopis].[id_casopis]) AS [pocet_clanku] FROM [Casopis] WHERE [Casopis].[kapacita] - (SELECT COUNT(*) FROM [Clanek] WHERE [Clanek].[casopis] = [Casopis].[id_casopis]) &gt; 0 ORDER BY [Casopis].[datum_uzaverky]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
