<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="agenda-autora.aspx.cs" Inherits="Agenda_Redakor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 class="text-center">
        <asp:Label ID="Label_nadpis" runat="server" Text="Agenda redaktora"></asp:Label></h3>
    <div class="obsah">
        <div class="text-center">
            <p><b>
                <asp:Label ID="Label4" runat="server" Font-Size="Larger" Text="Vyberte autora:"></asp:Label></b></p>
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource_vyber" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="id_user">
                <Columns>
                        <asp:TemplateField HeaderText="Operace">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
                    <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
                    <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource_vyber" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_user], [jmeno],[prijmeni] FROM [User] WHERE ([role] = 2)"></asp:SqlDataSource>
            <br />
            <br />
            <p><b>
                <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="Seznam článku vybraného autora:"></asp:Label></b></p>
            <asp:GridView CssClass="table table-dark table-striped table-borderless" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id_clanek" HeaderText="ID" SortExpression="id_clanek" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="abstrakt" HeaderText="Abstrakt" SortExpression="abstrakt" />
                    <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav" SortExpression="nazev_stav_cit" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT Clanek.id_clanek,Clanek.nadpis_clanku, Clanek.abstrakt, Stav.nazev_stav_cit FROM Clanek INNER JOIN Stav ON Clanek.stav = Stav.id_stav WHERE (Clanek.autor = @prideleno)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="prideleno" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
