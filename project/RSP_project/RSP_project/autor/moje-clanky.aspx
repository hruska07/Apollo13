<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="moje-clanky.aspx.cs" Inherits="zpetna_vazba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Zpětná vazba</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Moje články</h3>
    <div class="obsah">
        <div class="text-center row">
            <div class="col-sm-12">
                <p>Vaše všechny odeslané aktuální články:</p>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="zdroj3_zpetna_vazba" DataKeyNames="id_clanek">
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">
                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" SortExpression="id_clanek" InsertVisible="False" ReadOnly="True" Visible="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku" > <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku" > <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav" SortExpression="nazev_stav_cit" >
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="zdroj3_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [datum_clanku], [nazev_stav_cit] FROM [Clanek] JOIN [Stav] ON [Clanek].[stav] = [Stav].[id_stav] WHERE ([autor] = @autor) ORDER BY [datum_clanku]">
                    <SelectParameters>
                        <asp:SessionParameter Name="autor" SessionField="id_user" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

        <div class="text-center row">
            <div class="col-sm-12">
            </div>
        </div>

        <div class="text-center row">
            <div class="col-sm-12">
                <p>Info o konkrétním posudku (zobrazí se po vybrání výše):</p>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_posudek" DataSourceID="zdroj2_zpetna_vazba">
                    <Columns>
                        <asp:BoundField DataField="id_posudek" HeaderText="ID posudku" ReadOnly="True" SortExpression="id_posudek" InsertVisible="False" Visible="False" />
                        <asp:BoundField DataField="obsah_posudku" HeaderText="Obsah posudku" SortExpression="obsah_posudku" >
                        </asp:BoundField>
                        <asp:BoundField DataField="oponent" HeaderText="Oponent" SortExpression="oponent" Visible="False" />
                        <asp:BoundField DataField="datum_posudku" HeaderText="Datum posudku" SortExpression="datum_posudku" >
                        </asp:BoundField>
                        <asp:BoundField DataField="clanek" HeaderText="Článek" SortExpression="clanek" Visible="False" />
                        <asp:CheckBoxField DataField="zpristupnen" HeaderText="Zpřístupněn" SortExpression="zpristupnen" Visible="False" />
                        <asp:BoundField DataField="komentar" HeaderText="Komentář" SortExpression="komentar" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="zdroj2_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Posudek] WHERE ([clanek] = @clanek) AND ([zpristupnen]=1)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView3" Name="clanek" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>

