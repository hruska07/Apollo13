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
                <asp:GridView CssClass="table table-bordered" ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="zdroj3_zpetna_vazba" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" DataKeyNames="id_clanek">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">

                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center" />

                        </asp:TemplateField>

                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" SortExpression="id_clanek" InsertVisible="False" ReadOnly="True" Visible="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="obsah_clanku" HeaderText="Obsah článku" SortExpression="obsah_clanku" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav" SortExpression="nazev_stav_cit" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="zdroj3_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [obsah_clanku], [datum_clanku], [nazev_stav_cit] FROM [Clanek] JOIN [Stav] ON [Clanek].[stav] = [Stav].[id_stav] WHERE ([autor] = @autor) ORDER BY [datum_clanku]">
                    <SelectParameters>
                        <asp:SessionParameter Name="autor" SessionField="id_user" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

        <div class="text-center row">
            <div class="col-sm-12">
                <asp:SqlDataSource ID="zdroj1_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM Posudek JOIN Clanek ON clanek=id_clanek WHERE autor=3"></asp:SqlDataSource>
            </div>
        </div>


        <div class="text-center row">
            <div class="col-sm-12">
                <p>Info o konkrétním posudku (zobrazí se po vybrání výše):</p>
                <asp:GridView CssClass="table table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="id_posudek" DataSourceID="zdroj2_zpetna_vazba" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="id_posudek" HeaderText="id_posudek" ReadOnly="True" SortExpression="id_posudek" InsertVisible="False" Visible="False" />
                        <asp:BoundField DataField="obsah_posudku" HeaderText="Obsah posudku" SortExpression="obsah_posudku" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
                        <asp:BoundField DataField="datum_posudku" HeaderText="Datum posudku" SortExpression="datum_posudku" >
                        <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="zdroj2_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Posudek] WHERE ([clanek] = @clanek)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView3" Name="clanek" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>

