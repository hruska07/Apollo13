<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="stav-clanku.aspx.cs" Inherits="odeslani_stavu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
        }

        .auto-style2 {
            text-decoration: underline;
        }

        .auto-style4 {
            color: #FFFF00;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Stav článků</h3>
    <div class="obsah">
        <div class="text-center">
            <strong>
                <br class="auto-style2" />
            </strong><span class="auto-style1"><strong><span class="auto-style2">Zvolte autora:</span><br class="auto-style2" />
                <br class="auto-style2" />
            </strong></span>
        </div>
        <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="3" DataKeyNames="id_user" DataSourceID="zdroj_odeslani_stavu_grid1" HorizontalAlign="Center" Width="500px">
            <Columns>
                <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
                <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" />
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
        <asp:SqlDataSource ID="zdroj_odeslani_stavu_grid1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [jmeno], [login], [prijmeni], [id_user] FROM [User] WHERE ([role] = @role)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="role" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="text-center">
            <strong>
                <br class="auto-style2" />
            </strong><span class="auto-style1"><strong><span class="auto-style2">Vyberte článek vybranného autora:</span><br class="auto-style2" />
                <br class="auto-style2" />
            </strong></span>
            <br />
            <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id_clanek" DataSourceID="zdroj_rps" HorizontalAlign="Center">
                <AlternatingRowStyle BorderColor="Black" BorderStyle="Ridge" />
                <Columns>
                    <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                    <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
                    <asp:BoundField DataField="nazev_stav" HeaderText="nazev_stav" SortExpression="nazev_stav" />
                </Columns>
                <EditRowStyle HorizontalAlign="Justify" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle BorderStyle="Solid" ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="zdroj_rps" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT Clanek.id_clanek, Clanek.nadpis_clanku, Clanek.obsah_clanku,Clanek.datum_clanku,Clanek.autor,Stav.nazev_stav  FROM [Clanek] JOIN [Stav] ON Clanek.stav=Stav.id_stav WHERE ([autor] = @autor)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView11" Name="autor" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <span class="auto-style1"><strong><span class="auto-style2">
                <br />
                <br />
                Změnit stav zvoleného článku na :<br />
            </span>
                <span class="auto-style4"><em>1 nema_oponenta<br />
                    &nbsp;2 ma_oponenta<br />
                    3 ceka_na_posudek<br />
                    4 schvalen
        <br />
                    5 zamitnut<br />
                    &nbsp;6 zverejnen</em></span>
                <br />
                <br />
                <br />
                <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id_clanek" DataSourceID="SqlDataSource1a" DefaultMode="Edit" GridLines="Both" HorizontalAlign="Center" OnItemUpdated="zmena" OnPageIndexChanging="FormView1_PageIndexChanging1">
                    <EditItemTemplate>
                        id_clanek:
                <asp:Label ID="id_clanekLabel1" runat="server" Text='<%# Eval("id_clanek") %>' />
                        <br />
                        stav:
                <asp:TextBox ID="stavTextBox" runat="server" Text='<%# Bind("stav") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizovat" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Storno" />
                    </EditItemTemplate>
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="Black" />
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <InsertItemTemplate>
                        stav:
                <asp:TextBox ID="stavTextBox" runat="server" Text='<%# Bind("stav") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Vložit" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Storno" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        id_clanek:
                <asp:Label ID="id_clanekLabel" runat="server" Text='<%# Eval("id_clanek") %>' />
                        <br />
                        stav:
                <asp:Label ID="stavLabel" runat="server" Text='<%# Bind("stav") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Upravit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Odstranit" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nový" />
                    </ItemTemplate>
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1a" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" DeleteCommand="DELETE FROM [Clanek] WHERE [id_clanek] = @original_id_clanek AND [stav] = @original_stav" InsertCommand="INSERT INTO [Clanek] ([stav]) VALUES (@stav)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id_clanek], [stav] FROM [Clanek] WHERE ([id_clanek] = @id_clanek)" UpdateCommand="UPDATE [Clanek] SET [stav] = @stav WHERE [id_clanek] = @original_id_clanek AND [stav] = @original_stav">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id_clanek" Type="Int32" />
                        <asp:Parameter Name="original_stav" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="stav" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView12" Name="id_clanek" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="stav" Type="Int32" />
                        <asp:Parameter Name="original_id_clanek" Type="Int32" />
                        <asp:Parameter Name="original_stav" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource></span>
        </div>
    </div>
</asp:Content>

