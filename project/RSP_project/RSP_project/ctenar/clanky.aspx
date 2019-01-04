<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="clanky.aspx.cs" Inherits="zpetna_vazba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Moje články</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="obsah">

        <div class="text-center row">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" DataKeyNames="id_clanek" OnRowCommand="GridView3_RowCommand" Width="863px">
                    <Columns>
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" SortExpression="id_clanek" InsertVisible="False" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" > 
                        </asp:BoundField>
                        <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" > 
                        </asp:BoundField>
                        <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Akce" ShowHeader="True" Text="Detail" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RSPproject20181213121427_dbConnectionString %>" SelectCommand="SELECT * FROM [Clanek] WHERE ([stav] = @stav)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="6" Name="stav" Type="Int32" />
                    </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div class="text-center row">
        </div>
    </div>

</asp:Content>

