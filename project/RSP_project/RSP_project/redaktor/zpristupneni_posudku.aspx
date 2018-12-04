﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="zpristupneni_posudku.aspx.cs" Inherits="redaktor_zpristupneni_posudku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Zpřístupnění posudku</h3>
    <div class="obsah">
    <div class="text-center">
        <p style="text-decoration: underline;"><b>Vyberte autora:</b></p>
        <asp:gridview cssclass="table table-dark table-striped" id="GridView11" runat="server" autogeneratecolumns="False" datakeynames="id_user" datasourceid="zdroj_odeslani_stavu_grid1" OnSelectedIndexChanged="GridView11_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Operace">
                      <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>

                            <HeaderStyle CssClass="my-link" />

                </asp:TemplateField>
                <asp:BoundField DataField="login" HeaderText="Login" SortExpression="login" >
                <HeaderStyle CssClass="my-link" />
                </asp:BoundField>
                <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" >
                <HeaderStyle CssClass="my-link" />
                </asp:BoundField>
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" >
                <HeaderStyle CssClass="my-link" />
                </asp:BoundField>
                <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
       
            </Columns>
            <SelectedRowStyle cssClass="bg-dark text-center" /> 
            <SortedAscendingHeaderStyle CssClass="bg-dark"/>
            <SortedDescendingHeaderStyle CssClass="table-dark"/>
            <HeaderStyle CssClass="text-center my-link" />
            <RowStyle CssClass="text-center" />
        </asp:gridview>
        <asp:sqldatasource id="zdroj_odeslani_stavu_grid1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" selectcommand="SELECT [jmeno], [login], [prijmeni], [id_user] FROM [User] WHERE ([role] = @role)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="role" Type="Int32" />
            </SelectParameters>
        </asp:sqldatasource>
        <div class="text-center">
            <strong>
                <br class="auto-style2" />
            <asp:Label ID="Label1" runat="server" style="text-decoration: underline" Text="Vyberte článek vybraného autora:"></asp:Label>
            </strong><span class="auto-style1"><strong><br class="auto-style2" />
                <br class="auto-style2" />
                <asp:gridview cssclass="table table-dark table-striped" id="GridView12" runat="server" autogeneratecolumns="False" datakeynames="id_clanek" datasourceid="zdroj_rps" OnSelectedIndexChanged="GridView12_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Operace">

                        <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>
                        <HeaderStyle CssClass="my-link" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku">
                    <HeaderStyle CssClass="my-link" />
                    </asp:BoundField>
                    <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="autor" HeaderText="Autor" SortExpression="autor" Visible="False" />
                    <asp:BoundField DataField="nazev_stav" HeaderText="Stav" SortExpression="nazev_stav" />
                </Columns>
                <SelectedRowStyle cssClass="bg-dark text-center" /> 
                <SortedAscendingHeaderStyle CssClass="bg-dark"/>
                <SortedDescendingHeaderStyle CssClass="table-dark"/>
                <HeaderStyle CssClass="text-center my-link" />
                <RowStyle CssClass="text-center" />
            </asp:gridview>
            </strong></span>
        </div>
        <asp:sqldatasource id="zdroj_rps" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" selectcommand="SELECT Clanek.id_clanek, Clanek.nadpis_clanku, Clanek.datum_clanku,Clanek.autor,Stav.nazev_stav  FROM [Clanek] JOIN [Stav] ON Clanek.stav=Stav.id_stav WHERE ([autor] = @autor)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView11" Name="autor" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:sqldatasource>
        <div class="text-center">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Vyberte posudek:"></asp:Label>
            <span class="auto-style1"><strong><span class="auto-style2">
            <br />
        </span><br class="auto-style4" />
            <asp:GridView ID="GridView13" cssclass="table table-dark table-striped" runat="server" DataSourceID="posudek_novy" AutoGenerateColumns="False" DataKeyNames="id_posudek,id_user" OnSelectedIndexChanged="GridView13_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Operace">

                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select"/>
                            </ItemTemplate>

                    </asp:TemplateField>
                    <asp:BoundField DataField="id_posudek" HeaderText="Id posudku" InsertVisible="False" ReadOnly="True" SortExpression="id_posudek" />
                    <asp:BoundField DataField="login" HeaderText="Login oponenta" SortExpression="login" />
                    <asp:BoundField DataField="obsah_posudku" HeaderText="Obsah" SortExpression="obsah_posudku" />
                    <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
                    <asp:BoundField DataField="datum_posudku" HeaderText="Datum" SortExpression="datum_posudku" />
                    <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" Visible="False" />
                    <asp:CheckBoxField DataField="zpristupnen" HeaderText="Zpřístupněn" SortExpression="zpristupnen" />
                    <asp:BoundField DataField="komentar" HeaderText="Komentář" SortExpression="komentar" />
                    <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
                    <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" Visible="False" />
                    <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" Visible="False" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" Visible="False" />
                    <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" Visible="False" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                </Columns>
                <SelectedRowStyle cssClass="bg-dark text-center" /> 
                <SortedAscendingHeaderStyle CssClass="bg-dark"/>
                <SortedDescendingHeaderStyle CssClass="table-dark"/>
                <HeaderStyle CssClass="text-center my-link" />
                <RowStyle CssClass="text-center" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="posudek_novy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Posudek] JOIN [User] ON ([oponent]=[id_user]) WHERE ([clanek] = @clanek)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Posudek] WHERE [id_posudek] = @original_id_posudek AND [obsah_posudku] = @original_obsah_posudku AND [oponent] = @original_oponent AND [datum_posudku] = @original_datum_posudku AND [clanek] = @original_clanek AND (([zpristupnen] = @original_zpristupnen) OR ([zpristupnen] IS NULL AND @original_zpristupnen IS NULL)) AND (([komentar] = @original_komentar) OR ([komentar] IS NULL AND @original_komentar IS NULL))" InsertCommand="INSERT INTO [Posudek] ([obsah_posudku], [oponent], [datum_posudku], [clanek], [zpristupnen], [komentar]) VALUES (@obsah_posudku, @oponent, @datum_posudku, @clanek, @zpristupnen, @komentar)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Posudek] SET [obsah_posudku] = @obsah_posudku, [oponent] = @oponent, [datum_posudku] = @datum_posudku, [clanek] = @clanek, [zpristupnen] = @zpristupnen, [komentar] = @komentar WHERE [id_posudek] = @original_id_posudek AND [obsah_posudku] = @original_obsah_posudku AND [oponent] = @original_oponent AND [datum_posudku] = @original_datum_posudku AND [clanek] = @original_clanek AND (([zpristupnen] = @original_zpristupnen) OR ([zpristupnen] IS NULL AND @original_zpristupnen IS NULL)) AND (([komentar] = @original_komentar) OR ([komentar] IS NULL AND @original_komentar IS NULL))">
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
                <asp:Label ID="Label3" runat="server" Font-Underline="True" Text="Zpřístupněn:"></asp:Label>
            <br />
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Font-Underline="True" Text="Komentář:"></asp:Label>
            <br />
            <br />
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Height="234px" TextMode="MultiLine" Width="608px"></asp:TextBox>
                <br />
                <br />
            <asp:Button  ID="Button1" CssClass="btn btn-success btn-lg" runat="server" OnClick="Button1_Click" Text="Odeslat" />
            <br />
            <br />
                <br />
                </div>
    </div>
    </div>
</asp:Content>

