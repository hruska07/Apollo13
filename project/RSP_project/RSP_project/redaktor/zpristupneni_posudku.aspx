<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="zpristupneni_posudku.aspx.cs" Inherits="redaktor_zpristupneni_posudku" %>

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
                    <asp:BoundField DataField="autor" HeaderText="Autor" SortExpression="autor" Visible="False" />
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
            Vyberte posudek:<br />
        </span><br class="auto-style4" />
            <asp:GridView ID="GridView13" cssclass="table table-bordered" runat="server" DataSourceID="posudek_novy" AutoGenerateColumns="False" DataKeyNames="id_posudek" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="Operace">
                         <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>



                    </asp:TemplateField>
                    <asp:BoundField DataField="id_posudek" HeaderText="id_posudek" InsertVisible="False" ReadOnly="True" SortExpression="id_posudek" Visible="False" />
                    <asp:BoundField DataField="obsah_posudku" HeaderText="obsah_posudku" SortExpression="obsah_posudku" />
                    <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
                    <asp:BoundField DataField="datum_posudku" HeaderText="datum_posudku" SortExpression="datum_posudku" />
                    <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" Visible="False" />
                    <asp:CheckBoxField DataField="zpristupnen" HeaderText="zpristupnen" SortExpression="zpristupnen" />
                    <asp:BoundField DataField="komentar" HeaderText="komentar" SortExpression="komentar" />
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
            <asp:SqlDataSource ID="posudek_novy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Posudek] WHERE ([clanek] = @clanek)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Posudek] WHERE [id_posudek] = @original_id_posudek AND [obsah_posudku] = @original_obsah_posudku AND [oponent] = @original_oponent AND [datum_posudku] = @original_datum_posudku AND [clanek] = @original_clanek AND (([zpristupnen] = @original_zpristupnen) OR ([zpristupnen] IS NULL AND @original_zpristupnen IS NULL)) AND (([komentar] = @original_komentar) OR ([komentar] IS NULL AND @original_komentar IS NULL))" InsertCommand="INSERT INTO [Posudek] ([obsah_posudku], [oponent], [datum_posudku], [clanek], [zpristupnen], [komentar]) VALUES (@obsah_posudku, @oponent, @datum_posudku, @clanek, @zpristupnen, @komentar)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Posudek] SET [obsah_posudku] = @obsah_posudku, [oponent] = @oponent, [datum_posudku] = @datum_posudku, [clanek] = @clanek, [zpristupnen] = @zpristupnen, [komentar] = @komentar WHERE [id_posudek] = @original_id_posudek AND [obsah_posudku] = @original_obsah_posudku AND [oponent] = @original_oponent AND [datum_posudku] = @original_datum_posudku AND [clanek] = @original_clanek AND (([zpristupnen] = @original_zpristupnen) OR ([zpristupnen] IS NULL AND @original_zpristupnen IS NULL)) AND (([komentar] = @original_komentar) OR ([komentar] IS NULL AND @original_komentar IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_posudek" Type="Int32" />
                    <asp:Parameter Name="original_obsah_posudku" Type="String" />
                    <asp:Parameter Name="original_oponent" Type="Int32" />
                    <asp:Parameter Name="original_datum_posudku" Type="DateTime" />
                    <asp:Parameter Name="original_clanek" Type="Int32" />
                    <asp:Parameter Name="original_zpristupnen" Type="Boolean" />
                    <asp:Parameter Name="original_komentar" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="obsah_posudku" Type="String" />
                    <asp:Parameter Name="oponent" Type="Int32" />
                    <asp:Parameter Name="datum_posudku" Type="DateTime" />
                    <asp:Parameter Name="clanek" Type="Int32" />
                    <asp:Parameter Name="zpristupnen" Type="Boolean" />
                    <asp:Parameter Name="komentar" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView12" Name="clanek" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="obsah_posudku" Type="String" />
                    <asp:Parameter Name="oponent" Type="Int32" />
                    <asp:Parameter Name="datum_posudku" Type="DateTime" />
                    <asp:Parameter Name="clanek" Type="Int32" />
                    <asp:Parameter Name="zpristupnen" Type="Boolean" />
                    <asp:Parameter Name="komentar" Type="String" />
                    <asp:Parameter Name="original_id_posudek" Type="Int32" />
                    <asp:Parameter Name="original_obsah_posudku" Type="String" />
                    <asp:Parameter Name="original_oponent" Type="Int32" />
                    <asp:Parameter Name="original_datum_posudku" Type="DateTime" />
                    <asp:Parameter Name="original_clanek" Type="Int32" />
                    <asp:Parameter Name="original_zpristupnen" Type="Boolean" />
                    <asp:Parameter Name="original_komentar" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
                <br />
            <br />
            <span class="auto-style2">Upravte zde</span>:<asp:GridView ID="GridView14" cssclass="table table-bordered" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id_posudek" DataSourceID="zdroj_finnal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="Operace">
                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Upravit" ID="update_button" runat="server" CommandName="Edit"/>
                            </ItemTemplate>


                    </asp:TemplateField>
                    <asp:BoundField DataField="id_posudek" HeaderText="id_posudek" InsertVisible="False" ReadOnly="True" SortExpression="id_posudek" Visible="False" />
                    <asp:BoundField DataField="obsah_posudku" HeaderText="obsah_posudku" SortExpression="obsah_posudku" Visible="False" />
                    <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
                    <asp:BoundField DataField="datum_posudku" HeaderText="datum_posudku" SortExpression="datum_posudku" Visible="False" />
                    <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" Visible="False" />
                    <asp:CheckBoxField DataField="zpristupnen" HeaderText="zpristupnen" SortExpression="zpristupnen" />
                    <asp:BoundField DataField="komentar" HeaderText="komentar" SortExpression="komentar" />
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
            <asp:SqlDataSource ID="zdroj_finnal" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" DeleteCommand="DELETE FROM [Posudek] WHERE [id_posudek] = @original_id_posudek AND [obsah_posudku] = @original_obsah_posudku AND [oponent] = @original_oponent AND [datum_posudku] = @original_datum_posudku AND [clanek] = @original_clanek AND (([zpristupnen] = @original_zpristupnen) OR ([zpristupnen] IS NULL AND @original_zpristupnen IS NULL)) AND (([komentar] = @original_komentar) OR ([komentar] IS NULL AND @original_komentar IS NULL))" InsertCommand="INSERT INTO [Posudek] ([obsah_posudku], [oponent], [datum_posudku], [clanek], [zpristupnen], [komentar]) VALUES (@obsah_posudku, @oponent, @datum_posudku, @clanek, @zpristupnen, @komentar)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Posudek] WHERE ([id_posudek] = @id_posudek)" UpdateCommand="UPDATE [Posudek] SET [obsah_posudku] = @obsah_posudku, [oponent] = @oponent, [datum_posudku] = @datum_posudku, [clanek] = @clanek, [zpristupnen] = @zpristupnen, [komentar] = @komentar WHERE [id_posudek] = @original_id_posudek AND [obsah_posudku] = @original_obsah_posudku AND [oponent] = @original_oponent AND [datum_posudku] = @original_datum_posudku AND [clanek] = @original_clanek AND (([zpristupnen] = @original_zpristupnen) OR ([zpristupnen] IS NULL AND @original_zpristupnen IS NULL)) AND (([komentar] = @original_komentar) OR ([komentar] IS NULL AND @original_komentar IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_posudek" Type="Int32" />
                    <asp:Parameter Name="original_obsah_posudku" Type="String" />
                    <asp:Parameter Name="original_oponent" Type="Int32" />
                    <asp:Parameter Name="original_datum_posudku" Type="DateTime" />
                    <asp:Parameter Name="original_clanek" Type="Int32" />
                    <asp:Parameter Name="original_zpristupnen" Type="Boolean" />
                    <asp:Parameter Name="original_komentar" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="obsah_posudku" Type="String" />
                    <asp:Parameter Name="oponent" Type="Int32" />
                    <asp:Parameter Name="datum_posudku" Type="DateTime" />
                    <asp:Parameter Name="clanek" Type="Int32" />
                    <asp:Parameter Name="zpristupnen" Type="Boolean" />
                    <asp:Parameter Name="komentar" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView13" Name="id_posudek" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="obsah_posudku" Type="String" />
                    <asp:Parameter Name="oponent" Type="Int32" />
                    <asp:Parameter Name="datum_posudku" Type="DateTime" />
                    <asp:Parameter Name="clanek" Type="Int32" />
                    <asp:Parameter Name="zpristupnen" Type="Boolean" />
                    <asp:Parameter Name="komentar" Type="String" />
                    <asp:Parameter Name="original_id_posudek" Type="Int32" />
                    <asp:Parameter Name="original_obsah_posudku" Type="String" />
                    <asp:Parameter Name="original_oponent" Type="Int32" />
                    <asp:Parameter Name="original_datum_posudku" Type="DateTime" />
                    <asp:Parameter Name="original_clanek" Type="Int32" />
                    <asp:Parameter Name="original_zpristupnen" Type="Boolean" />
                    <asp:Parameter Name="original_komentar" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
                <br />
                </div>
    </div>
    </div>
    </strong></span>
</asp:Content>

