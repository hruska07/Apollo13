<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="clanky-posudky.aspx.cs" Inherits="redaktor_zpristupneni_posudku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Správa článků - posudků</h3>
    <div class="obsah">
        <div class="text-center">

            <p><b><asp:Label ID="Label5" runat="server" Font-Size="Larger" Text="Vyberte autora:"></asp:Label></b></p>

            <asp:DropDownList CssClass="form-control my-dropdown" ID="DropDownList_autor" runat="server" DataSourceID="zdroj_odeslani_stavu_grid1" DataTextField="cele_jmeno" DataValueField="id_user" AutoPostBack="true">
             </asp:DropDownList>
            <asp:SqlDataSource ID="zdroj_odeslani_stavu_grid1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT ([jmeno] + ' ' + [prijmeni]) AS cele_jmeno, [id_user] FROM [User] WHERE ([role] = @role)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="role" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="text-center">
                <br />
                <p>
                    <strong><asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="Vyberte článek vybraného autora:"></asp:Label></strong>
                </p>
                <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="zdroj_rps" OnRowCommand="GridView12_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">

                            <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku"></asp:BoundField>
                        <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="autor" HeaderText="Autor" SortExpression="autor" Visible="False" />
                        <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav" SortExpression="nazev_stav_cit" />
                         <asp:TemplateField HeaderText="Detail">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-info" Text="Detail" ID="detail_button" runat="server" CausesValidation="false" CommandName="ShowDetail" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Verze">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-warning" Text="Předchozí verze" ID="version_button" runat="server" CausesValidation="false" CommandName="Version" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Schválit">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-success" Text="Schválit" ID="Button_schvalit" runat="server" CausesValidation="false" CommandName="Schvalit" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zamítnout">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-danger" Text="Zamítnout" ID="Button_zamitnout" runat="server" CausesValidation="false" CommandName="Zamitnout" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="zdroj_rps" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT Clanek.id_clanek, Clanek.nadpis_clanku, Clanek.datum_clanku,Clanek.autor,Stav.nazev_stav_cit  FROM [Clanek] JOIN [Stav] ON Clanek.stav=Stav.id_stav WHERE ([autor] = @autor AND Stav.id_stav <> 4 AND Stav.id_stav <> 5)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList_autor" Name="autor" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="text-center">
                <br />
                <p><b><asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Text="Vyberte posudek:"></asp:Label></b></p>

                <asp:GridView ID="GridView13" runat="server" DataSourceID="posudek_novy" AutoGenerateColumns="False" DataKeyNames="id_posudek" OnSelectedIndexChanged="GridView13_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="Operace">

                             <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:BoundField DataField="login" HeaderText="Login oponenta" SortExpression="login" />
                        <asp:BoundField DataField="id_posudek" HeaderText="id_posudek" InsertVisible="False" ReadOnly="True" SortExpression="id_posudek" Visible="False" />
                        <asp:BoundField DataField="namety_k_diskuzi" HeaderText="namety_k_diskuzi" SortExpression="namety_k_diskuzi" Visible="False" />
                        <asp:BoundField DataField="kriterium1" HeaderText="Kritérium 1" SortExpression="kriterium1" />
                        <asp:BoundField DataField="kriterium2" HeaderText="Kritérium 2" SortExpression="kriterium2" />
                        <asp:BoundField DataField="kriterium3" HeaderText="Kritérium 3" SortExpression="kriterium3" />
                        <asp:BoundField DataField="doplnujici_komentar" HeaderText="doplnujici_komentar" SortExpression="doplnujici_komentar" Visible="False" />
                        <asp:BoundField DataField="souhrnne_vyjadreni" HeaderText="souhrnne_vyjadreni" SortExpression="souhrnne_vyjadreni" Visible="False" />
                        <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" Visible="False" />
                        <asp:BoundField DataField="datum_posudku" HeaderText="Datum vložení" SortExpression="datum_posudku" />
                        <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" Visible="False" />
                        <asp:CheckBoxField DataField="zpristupnen" HeaderText="Zpřístupněn" SortExpression="zpristupnen" />
                        <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" InsertVisible="False" ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" Visible="False" />
                        <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" Visible="False" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" Visible="False" />
                        <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                    </Columns>
                </asp:GridView>
                <br />
                <b><asp:Label ID="Label6" Font-Size="Larger" runat="server" Text="Náměty k diskuzi:" Visible="False"></asp:Label></b>
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
                <asp:TextBox ID="TextBox2" runat="server" Height="234px" Visible="False" Width="100%" TextMode="MultiLine"></asp:TextBox>
                <br />
                <b><asp:Label ID="Label7" Font-Size="Larger" runat="server" Text="Souhrnné vyjádření:" Visible="False"></asp:Label></b>
                <br />
                <br />
                <asp:DropDownList CssClass="form-control" ID="DropDownList_souhrnne_vyjadreni" runat="server" DataSourceID="SqlDataSource1" DataTextField="text_vyjadreni" DataValueField="id_vyjadreni" Visible="false">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Souhrnne_vyjadreni]"></asp:SqlDataSource>
                <br />
                <br />
                <p><b><asp:Label ID="Label3" Font-Size="Larger" runat="server" Text="Zpřístupněn:"></asp:Label></b></p>
                <asp:CheckBox ID="CheckBox1" runat="server" />
                <br />
                <br />
                <p><b><asp:Label ID="Label4" runat="server" Font-Size="Larger" Text="Komentář redaktora:"></asp:Label></b></p>
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Height="234px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button1" CssClass="btn btn-success btn-lg" runat="server" OnClick="Button1_Click" Text="Odeslat" />
            </div>
        </div>
    </div>
</asp:Content>

