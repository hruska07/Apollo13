<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="stav-clanku.aspx.cs" Inherits="oponent_stav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Stav článků</h3>

    <div class="obsah">
        <div class="text-center">
            <strong>Vyberte z přidělených článků:<br /><br />
            </strong>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="zdrojak" DataKeyNames="id_clanek,id_user,Id_propoj,id_stav" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
                <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
                <asp:BoundField DataField="Id_propoj" HeaderText="Id_propoj" SortExpression="Id_propoj" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:TemplateField HeaderText="Operace">
                    <ItemTemplate>
                        <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno"></asp:BoundField>
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni"></asp:BoundField>
                <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku"></asp:BoundField>
                <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku"></asp:BoundField>
                <asp:BoundField DataField="Stav" HeaderText="Stav" SortExpression="Stav" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav" SortExpression="nazev_stav_cit"></asp:BoundField>
                <asp:BoundField DataField="id_stav" HeaderText="id_stav" InsertVisible="False" ReadOnly="True" SortExpression="id_stav" Visible="False"></asp:BoundField>
                  <asp:TemplateField HeaderText="Detail">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-info" Text="Detail" ID="detail_button" runat="server" CausesValidation="false" CommandName="ShowDetail" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="zdrojak" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Clanek].id_clanek,[User].id_user,[Propoj_clanek_oponent].Id_propoj,[User].jmeno,[User].prijmeni,[Clanek].nadpis_clanku,[Clanek].datum_clanku,[Clanek].Stav,[Stav].nazev_stav_cit,[Stav].id_stav  FROM Propoj_clanek_oponent JOIN [Clanek] ON clanek=id_clanek JOIN [User] ON autor=id_user JOIN [Stav] ON [Clanek].stav=[Stav].id_stav WHERE ([oponent]=@oponent)">
            <SelectParameters>
                        <asp:SessionParameter Name="oponent" SessionField="id_user" Type="Int32" />
                    </SelectParameters>

        </asp:SqlDataSource>
        <br />
        <br />

        <div class="text-center">
            <strong>Pokud chcete, můžete vybraný článek odmítnout tlačítkem níže:<br />
            <br />
            <asp:Button CssClass="btn btn-lg btn-success" ID="Button1" runat="server" Text="Odmítnout" OnClick="Button1_Click" Enabled="False" />
            <br />
            </strong>
            <br />

        </div>
    </div>

</asp:Content>

