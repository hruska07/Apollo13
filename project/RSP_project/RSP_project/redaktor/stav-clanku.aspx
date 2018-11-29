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

        .auto-style5 {
            /*display: inline-block;*/
            padding: 15px;
            background-color: rgba(0, 0, 0, 0.25);
            text-align: center;
            font-size: 16px;
            line-height: 170%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="auto-style5">
        <asp:GridView CssClass="table table-dark table-striped table-borderless" ID="GridView11" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="zdroj_odeslani_stavu_grid1">
            <Columns>
                <asp:TemplateField HeaderText="Operace">
                    <ItemTemplate>
                        <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                    </ItemTemplate>

                    <HeaderStyle CssClass="my-link" />

                </asp:TemplateField>
                <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno">
                    <HeaderStyle CssClass="my-link" />
                </asp:BoundField>
                <asp:BoundField DataField="login" HeaderText="Login" SortExpression="login">
                    <HeaderStyle CssClass="my-link" />
                </asp:BoundField>
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni">
                    <HeaderStyle CssClass="my-link" />
                </asp:BoundField>
                <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />

            </Columns>
            <SelectedRowStyle CssClass="bg-dark text-center" />
            <SortedAscendingHeaderStyle CssClass="bg-dark"/>
            <SortedDescendingHeaderStyle CssClass="table-dark"/>
            <HeaderStyle CssClass="text-center my-link" />
            <RowStyle CssClass="text-center" />
        </asp:GridView>
        <asp:SqlDataSource ID="zdroj_odeslani_stavu_grid1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [jmeno], [login], [prijmeni], [id_user] FROM [User] WHERE ([role] = @role)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="role" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="text-center">
            <strong>
                <br class="auto-style2" />
            </strong><span class="auto-style1"><strong><span class="auto-style2">Vyberte článek vybraného autora:</span><br class="auto-style2" />
                <br class="auto-style2" />
                <asp:GridView CssClass="table table-dark table-striped table-borderless" ID="GridView12" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="zdroj_rps">
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">

                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="my-link" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku">
                            <HeaderStyle CssClass="my-link" />
                        </asp:BoundField>
                        <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="autor" HeaderText="Autor" SortExpression="autor" Visible="False" />
                        <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav" SortExpression="nazev_stav" />
                    </Columns>
                    <SelectedRowStyle CssClass="bg-dark text-center" />
                    <SortedAscendingHeaderStyle CssClass="bg-dark"/>
                    <SortedDescendingHeaderStyle CssClass="table-dark"/>
                    <HeaderStyle CssClass="text-center my-link" />
                    <RowStyle CssClass="text-center" />
                </asp:GridView>
            </strong></span>
        </div>
        <asp:SqlDataSource ID="zdroj_rps" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT Clanek.id_clanek, Clanek.nadpis_clanku, Clanek.datum_clanku,Clanek.autor,Stav.nazev_stav_cit  FROM [Clanek] JOIN [Stav] ON Clanek.stav=Stav.id_stav WHERE ([autor] = @autor)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView11" Name="autor" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="text-center">
            <span class="auto-style2">
                <strong>Změnit stav zvoleného článku na:<br /></span>
            <span class="auto-style4">
                <em>1 - Nemá oponenta<br />
                    2 - Má oponenta<br />
                    3 - Čeká na posudek<br />
                    4 - Schválen<br />
                    5 - Zamítnut<br />
                    6 - Zveřejněn
                </em>
            </span>
        </div>
        <asp:FormView CssClass="table table-dark table-striped table-borderless" ID="FormView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id_clanek" DataSourceID="SqlDataSource1a" DefaultMode="Edit" GridLines="Both" HorizontalAlign="Center" OnItemUpdated="zmena" OnPageIndexChanging="FormView1_PageIndexChanging1">
            <EditItemTemplate>
                ID článku:
                <asp:Label ID="id_clanekLabel1" runat="server" Text='<%# Eval("id_clanek") %>' />
                <br />
                Stav:
                <asp:TextBox ID="stavTextBox" runat="server" Text='<%# Bind("stav") %>' />
                <br />
                <asp:LinkButton cssClass="btn btn-danger mt-1"  ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizovat" />
                &nbsp;<asp:LinkButton cssClass="btn btn-danger mt-1" ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Storno" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Stav:
                <asp:TextBox ID="stavTextBox" runat="server" Text='<%# Bind("stav") %>' />
                <br />
                <asp:LinkButton cssClass="btn btn-danger" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Vložit" />
                &nbsp;<asp:LinkButton cssClass="btn btn-danger"  ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Storno" />
            </InsertItemTemplate>
            <ItemTemplate>
                ID článku:
                <asp:Label ID="id_clanekLabel" runat="server" Text='<%# Eval("id_clanek") %>' />
                <br />
                Stav:
                <asp:Label ID="stavLabel" runat="server" Text='<%# Bind("stav") %>' />
                <br />
                <asp:LinkButton cssClass="btn btn-danger"  ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Upravit" />
                &nbsp;<asp:LinkButton cssClass="btn btn-danger"  ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Odstranit" />
                &nbsp;<asp:LinkButton cssClass="btn btn-danger"  ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nový" />
            </ItemTemplate>
            <EditRowStyle CssClass="bg-dark text-center" />
            <HeaderStyle CssClass="text-center my-link" />
            <RowStyle CssClass="text-center" />
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
        </asp:SqlDataSource>
</asp:Content>

