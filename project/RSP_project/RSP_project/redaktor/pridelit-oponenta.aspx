<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pridelit-oponenta.aspx.cs" Inherits="redaktor_prideleni_oponenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Přidělit oponenta</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h3 class="text-center">Přiřazení článku oponentovi</h3>
    <div class="obsah">
        <div class="row">
            <div class="col-sm-8">
                <p><strong>Vyber článek z tabulky:</strong></p>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">
                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button1" runat="server" CommandName="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_clanek" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis" SortExpression="nadpis_clanku" />
                        <asp:BoundField DataField="datum_clanku" HeaderText="Datum vložení" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="autor" HeaderText="ID Autora" SortExpression="autor" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [datum_clanku], [autor] FROM [Clanek] INNER JOIN [Stav] ON [Clanek].stav = [Stav].id_stav WHERE ([nazev_stav] = @nazev_stav)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="nema_oponenta" Name="nazev_stav" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <strong>
                    <p>Vybrané ID článku:&nbsp;<asp:Label ID="Label1_vybrany_clanek" runat="server" Font-Size="Medium"></asp:Label></p>
               </strong>
            </div>

            <div class="col-sm-4">
                <p><strong>Vyberte 2 oponenty ze seznamu:</strong></p>

                <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="seznam_oponentu" DataTextField="cele_jmeno" DataValueField="id_user" Font-Size="Medium" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="seznam_oponentu" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT id_user,role,jmeno,prijmeni,(jmeno +' '+ prijmeni) AS [cele_jmeno] FROM [User] WHERE ([role] = @role)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="role" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />

                <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="cele_jmeno" DataValueField="id_user" Font-Size="Medium">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT id_user,role,jmeno,prijmeni,(jmeno +' '+ prijmeni) AS [cele_jmeno] FROM [User] WHERE ([role] = @role AND [id_user] <> @id_user)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="role" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="id_user" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
              
                <br />

                <p><strong>Vyber, do kdy má oponent vydat posudek:</strong></p>

                <div style="min-height: 256px;">
                    <div style="background-color: #ffffff; color: #000000;">
                        <asp:TextBox CssClass="form-control datetimepicker" ID="textbox_datum" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="col-sm-12 text-center">
                    <asp:Button CssClass="btn btn-lg btn-success" ID="Button1" Enabled="False" runat="server" OnClick="Button1_Click" Text="Potvrď výběr článku k oponentovi" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
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
