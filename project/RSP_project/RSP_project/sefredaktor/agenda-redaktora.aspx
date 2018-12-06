<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="agenda-redaktora.aspx.cs" Inherits="Agenda_Redakor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 class="text-center">
        <asp:Label ID="Label_nadpis" runat="server" Text="Agenda redaktora"></asp:Label></h3>
    <div class="obsah">
        <div class="text-center">
            <p><b>
                <asp:Label ID="Label4" runat="server" Font-Size="Larger" Text="Vyberte redaktora:"></asp:Label></b></p>
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource_vyber" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="id_user">
                <Columns>
                    <asp:TemplateField HeaderText="Operace">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
                    <asp:BoundField DataField="jmeno" HeaderText="Jméno redaktora" SortExpression="jmeno" />
                    <asp:BoundField DataField="prijmeni" HeaderText="Příjmení redaktora" SortExpression="prijmeni" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource_vyber" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_user], [jmeno],[prijmeni] FROM [User] WHERE ([role] = 4)"></asp:SqlDataSource>
            <br />
            <br />
            <p><b>
                <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="Seznam spravovaných oponentů:"></asp:Label></b></p>
            <asp:GridView CssClass="table table-dark table-striped table-borderless" ID="GridView1" runat="server" DataSourceID="SqlDataSource_AgendaRedaktor" AutoGenerateColumns="False" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="Přidělený článek" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav přiděleného článku" SortExpression="nazev_stav_cit" />
                    <asp:BoundField DataField="jmeno" HeaderText="Jméno oponenta" SortExpression="jmeno" />
                    <asp:BoundField DataField="prijmeni" HeaderText="Přijmení oponenta" SortExpression="prijmeni" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource_AgendaRedaktor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [User].jmeno,[User].prijmeni,[Clanek].nadpis_clanku,[Stav].nazev_stav_cit
FROM [User] JOIN [Propoj_clanek_oponent] ON ([User].id_user = [Propoj_clanek_oponent].oponent) JOIN [Clanek] ON([Clanek].id_clanek=[Propoj_clanek_oponent].clanek) JOIN Stav ON ([Clanek].stav=[Stav].id_stav)
WHERE prideleno=@prideleno">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="prideleno" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
