<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="odeslat-oponentovi.aspx.cs" Inherits="redaktor_odeslat_clanek" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 class="text-center">Články k posouzení</h3>
    <div class="obsah">
        <div class="row" style="min-height: 320px;">
            <div class="col-sm-8">
                <span class="auto-style1"><strong><span class="auto-style2">
                    <p>Vyberte přidělený článek:</p>
                </span></strong></span>

                <asp:GridView CssClass="table table-dark table-striped table-borderless" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="seznam_pridelenych_clanku" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">
                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button1" runat="server" CommandName="Select" />
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_clanek" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis" SortExpression="nadpis_clanku" />
                        <asp:BoundField DataField="datum_clanku" HeaderText="Datum vložení" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="autor" HeaderText="ID Autora" SortExpression="autor" />
                    </Columns>
                    <SelectedRowStyle cssClass="bg-dark text-center" />
                    <SortedAscendingHeaderStyle CssClass="bg-dark"/>
                    <SortedDescendingHeaderStyle CssClass="table-dark"/>
                    <HeaderStyle CssClass="text-center my-link" />
                    <RowStyle CssClass="text-center" />
                </asp:GridView>
                <asp:SqlDataSource ID="seznam_pridelenych_clanku" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [datum_clanku], [autor] FROM [Clanek] JOIN [Stav] ON [Clanek].[stav] = [Stav].[id_stav] WHERE ([nazev_stav] = @nazev_stav)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ma_oponenta" Name="nazev_stav" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="col-sm-4">
                <p><strong>Vyberte, do kdy má oponent vydat posudek:</strong></p>

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
    </div>

</asp:Content>

