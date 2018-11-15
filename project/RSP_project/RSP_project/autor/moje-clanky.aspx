<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="moje-clanky.aspx.cs" Inherits="zpetna_vazba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Zpětná vazba</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Moje články</h3>
    <div class="obsah">
        <div class="text-center row">
            <div class="col-sm-12">
                <p>Vaše všechny odeslané aktuální články: [pro uživatele id:3 (pro test)]</p>
                <asp:GridView CssClass="table table-bordered" ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_clanek" DataSourceID="zdroj3_zpetna_vazba" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                        <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                        <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />

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
                <asp:SqlDataSource ID="zdroj3_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM Clanek WHERE autor=3"></asp:SqlDataSource>
            </div>
        </div>

        <div class="text-center row">
            <div class="col-sm-12">
                <p>Články ke kterým je dostupný <strong>posudek</strong>:</p>
                <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="id_clanek" DataSourceID="zdroj1_zpetna_vazba" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                        <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                        <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />

                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#FF9B82" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="zdroj1_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM Posudek JOIN Clanek ON clanek=id_clanek WHERE autor=3"></asp:SqlDataSource>
            </div>
        </div>


        <div class="text-center row">
            <div class="col-sm-12">
                <p>Info o konkrétním posudku (zobrazí se po vybrání výše):</p>
                <asp:GridView CssClass="table table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_posudek" DataSourceID="zdroj2_zpetna_vazba" HorizontalAlign="Center" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="id_posudek" HeaderText="id_posudek" ReadOnly="True" SortExpression="id_posudek" />
                        <asp:BoundField DataField="obsah_posudku" HeaderText="obsah_posudku" SortExpression="obsah_posudku" />
                        <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" />
                        <asp:BoundField DataField="datum_posudku" HeaderText="datum_posudku" SortExpression="datum_posudku" />
                        <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="zdroj2_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Posudek] WHERE ([clanek] = @clanek)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="clanek" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>

