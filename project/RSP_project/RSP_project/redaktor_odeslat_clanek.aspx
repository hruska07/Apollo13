<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="redaktor_odeslat_clanek.aspx.cs" Inherits="redaktor_odeslat_clanek" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="text-center">&nbsp;</h2>
    <h2 class="text-center">Články k posouzení<br /></h2>
    <table style="width:100%;" border="1">
        <tr>
            <td>Vyberte článek, který chcete odeslat k posouzení:</td>
            <td>Nastavte vybranému článku datum, do kdy má být posouzen:</td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right: 10px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="seznam_pridelenych_clanku" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                        <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                        <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="seznam_pridelenych_clanku" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [obsah_clanku], [datum_clanku], [autor] FROM [Clanek] JOIN [Stav] ON [Clanek].[stav] = [Stav].[id_stav] WHERE ([nazev_stav] = @nazev_stav)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ma_oponenta" Name="nazev_stav" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="text-align: right; padding-right: 10px;">
                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button_odeslat" runat="server" Enabled="False" Text="Odeslat k posouzení" OnClick="Button_odeslat_Click" />
            </td>
        </tr>
        <tr>
            <td class="text-center" colspan="2">
                <asp:Label ID="Label_message" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

