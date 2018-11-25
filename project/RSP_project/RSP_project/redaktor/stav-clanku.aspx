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
        <asp:gridview cssclass="table table-bordered" id="GridView11" runat="server" autogeneratecolumns="False" backcolor="White" bordercolor="#CCCCCC" borderstyle="None" borderwidth="1px" cellpadding="3" datakeynames="id_user" datasourceid="zdroj_odeslani_stavu_grid1" horizontalalign="Center" width="500px">
            <Columns>
                <asp:TemplateField HeaderText="Operace">
                      <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center" />

                </asp:TemplateField>
                <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" >
                <HeaderStyle CssClass="text-center" />
                </asp:BoundField>
                <asp:BoundField DataField="login" HeaderText="Login" SortExpression="login" >
                <HeaderStyle CssClass="text-center" />
                </asp:BoundField>
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" >
                <HeaderStyle CssClass="text-center" />
                </asp:BoundField>
                <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
       
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
        </asp:gridview>
        <asp:sqldatasource id="zdroj_odeslani_stavu_grid1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" selectcommand="SELECT [jmeno], [login], [prijmeni], [id_user] FROM [User] WHERE ([role] = @role)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="role" Type="Int32" />
            </SelectParameters>
        </asp:sqldatasource>
        <div class="text-center">
            <strong>
                <br class="auto-style2" />
            </strong><span class="auto-style1"><strong><span class="auto-style2">Vyberte článek vybranného autora:</span><br class="auto-style2" />
                <br class="auto-style2" />
                <asp:gridview cssclass="table table-bordered" id="GridView12" runat="server" autogeneratecolumns="False" datakeynames="id_clanek" datasourceid="zdroj_rps" backcolor="White" bordercolor="#CCCCCC" borderstyle="None" borderwidth="1px" cellpadding="3">
                <Columns>
                    <asp:TemplateField HeaderText="Operace">

                        <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku">
                    <HeaderStyle CssClass="text-center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="obsah_clanku" HeaderText="Obsah článku" SortExpression="obsah_clanku" />
                    <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="autor" HeaderText="Autor" SortExpression="autor" />
                    <asp:BoundField DataField="nazev_stav" HeaderText="Stav" SortExpression="nazev_stav" />
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
            </asp:gridview>
            </strong></span>
        </div>
        <asp:sqldatasource id="zdroj_rps" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" selectcommand="SELECT Clanek.id_clanek, Clanek.nadpis_clanku, Clanek.obsah_clanku,Clanek.datum_clanku,Clanek.autor,Stav.nazev_stav  FROM [Clanek] JOIN [Stav] ON Clanek.stav=Stav.id_stav WHERE ([autor] = @autor)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView11" Name="autor" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:sqldatasource>
        <div class="text-center">
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
                &nbsp;6 zverejnen</em></span><br class="auto-style4" />
            <span class="auto-style1">
                <br />
                </div>
                <asp:formview id="FormView1" runat="server" backcolor="White" bordercolor="#CCCCCC" borderstyle="None" borderwidth="1px" cellpadding="3" datakeynames="id_clanek" datasourceid="SqlDataSource1a" defaultmode="Edit" gridlines="Both" horizontalalign="Center" onitemupdated="zmena" onpageindexchanging="FormView1_PageIndexChanging1">
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
        </asp:formview>
                <asp:sqldatasource id="SqlDataSource1a" runat="server" conflictdetection="CompareAllValues" connectionstring="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" deletecommand="DELETE FROM [Clanek] WHERE [id_clanek] = @original_id_clanek AND [stav] = @original_stav" insertcommand="INSERT INTO [Clanek] ([stav]) VALUES (@stav)" oldvaluesparameterformatstring="original_{0}" selectcommand="SELECT [id_clanek], [stav] FROM [Clanek] WHERE ([id_clanek] = @id_clanek)" updatecommand="UPDATE [Clanek] SET [stav] = @stav WHERE [id_clanek] = @original_id_clanek AND [stav] = @original_stav">
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
        </asp:sqldatasource>
            </span>
    </div>
    </div>
    </strong></span>
</asp:Content>

