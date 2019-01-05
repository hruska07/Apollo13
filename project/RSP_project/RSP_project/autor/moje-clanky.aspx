<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="moje-clanky.aspx.cs" Inherits="zpetna_vazba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Moje články</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Moje články</h3>
    <div class="obsah">
        <div class="text-center row">
            <div class="col-sm-12">
                <p>Vaše všechny odeslané aktuální články:</p>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="zdroj3_zpetna_vazba" DataKeyNames="id_clanek, nazev_stav" OnRowCommand="GridView3_RowCommand" OnRowDataBound="GridView3_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">
                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" SortExpression="id_clanek" InsertVisible="False" ReadOnly="True" Visible="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nazev_stav" HeaderText="nazev_stav" SortExpression="nazev_stav" InsertVisible="False" ReadOnly="True" Visible="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku" > <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku" > <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav" SortExpression="nazev_stav_cit" >
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Detail">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-info" Text="Detail" ID="detail_button" runat="server" CausesValidation="false" CommandName="ShowDetail" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Upravit">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-warning" Text="Upravit článek" ID="upravit_button" runat="server" CausesValidation="false" CommandName="EditArticle" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="zdroj3_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [datum_clanku], [nazev_stav_cit], [nazev_stav] FROM [Clanek] JOIN [Stav] ON [Clanek].[stav] = [Stav].[id_stav] WHERE ([autor] = @autor) ORDER BY [datum_clanku]">
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

        <hr class="border-white"/>

        <div class="text-center row">
            <div class="col-sm-12">
                <p>Info o konkrétním posudku (zobrazí se po vybrání výše):</p>

                                <asp:GridView ID="GridView13" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="id_posudek" OnSelectedIndexChanged="GridView13_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">

                             <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:BoundField DataField="login" HeaderText="Login oponenta" SortExpression="login" Visible="false" />
                        <asp:BoundField DataField="id_posudek" HeaderText="id_posudek" InsertVisible="False" ReadOnly="True" SortExpression="id_posudek" Visible="False" />
                        <asp:BoundField DataField="namety_k_diskuzi" HeaderText="namety_k_diskuzi" SortExpression="namety_k_diskuzi" Visible="False" />
                        <asp:BoundField DataField="kriterium1" HeaderText="Struktura práce" SortExpression="kriterium1" />
                        <asp:BoundField DataField="kriterium2" HeaderText="Použité metody zpracování" SortExpression="kriterium2" />
                        <asp:BoundField DataField="kriterium3" HeaderText="Metody zhodnocení výsledků" SortExpression="kriterium3" />
                        <asp:BoundField DataField="doplnujici_komentar" HeaderText="doplnujici_komentar" SortExpression="doplnujici_komentar" Visible="False" />
                        <asp:BoundField DataField="text_vyjadreni" HeaderText="Souhrnné vyjádření" SortExpression="text_vyjadreni" />
                        <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
                        <asp:BoundField DataField="datum_posudku" HeaderText="Datum vložení" SortExpression="datum_posudku" />
                        <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" Visible="False" />
                        <asp:CheckBoxField DataField="zpristupnen" HeaderText="Zpřístupněn" SortExpression="zpristupnen" Visible="false" />
                        <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" InsertVisible="False" ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" Visible="False" />
                        <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" Visible="False" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" Visible="False" />
                        <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                    </Columns>
                </asp:GridView>
                <br />
                <b><asp:Label ID="Label6" Font-Size="Larger" runat="server" Text="Náměty k diskuzi:" Visible="False"></asp:Label></b>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Posudek] JOIN [Souhrnne_vyjadreni] ON [Posudek].souhrnne_vyjadreni=[Souhrnne_vyjadreni].id_vyjadreni WHERE ([clanek] = @clanek) AND ([zpristupnen]=1)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView3" Name="clanek" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="TextBox2" runat="server" Height="234px" Visible="False" Width="100%" TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                <p><b><asp:Label ID="Label4" runat="server" Font-Size="Larger" Text="Komentář redaktora:" Visible="false"></asp:Label></b></p>
                <asp:TextBox ID="TextBox1" runat="server" Height="234px" TextMode="MultiLine" Width="100%" Visible="false"></asp:TextBox>
            </div>
        </div>
    </div>

</asp:Content>

