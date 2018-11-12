<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="redaktor_odeslat_clanek.aspx.cs" Inherits="redaktor_odeslat_clanek" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $('.datetimepicker').datetimepicker({
                inline: true,
                sideBySide: true,
                locale: 'cs',
                format: "DD.MM.YYYY HH:mm",
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 class="text-center">Články k posouzení</h3>
    <div class="row" style="min-height: 320px;">
        <div class="col-sm-8">
            <p>Vyberte přidělený článek:</p>
            <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="seznam_pridelenych_clanku" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                    <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
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
            <asp:SqlDataSource ID="seznam_pridelenych_clanku" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [obsah_clanku], [datum_clanku], [autor] FROM [Clanek] JOIN [Stav] ON [Clanek].[stav] = [Stav].[id_stav] WHERE ([nazev_stav] = @nazev_stav)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="ma_oponenta" Name="nazev_stav" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div class="col-sm-4">
            <p>Vyberte, do kdy má oponent vydat posudek:</p>
            <div style="background-color: #ffffff; color: #000000;">
                <asp:TextBox CssClass="form-control datetimepicker" ID="textbox_datum" runat="server"></asp:TextBox>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-sm-12 text-center">
            <asp:Button CssClass="btn btn-success btn-lg" ID="Button_odeslat" runat="server" Enabled="False" Text="Odeslat k posouzení" OnClick="Button_odeslat_Click" />
            <asp:Label ID="Label_message" runat="server" Visible="False"></asp:Label>
        </div>
    </div>

    
</asp:Content>

