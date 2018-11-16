<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="agenda-redaktora.aspx.cs" Inherits="Agenda_Redakor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 class="text-center"><asp:Label ID="Label_nadpis" runat="server" Text="Agenda Redaktora"></asp:Label></h3>
    <table style="width:100%;" border="0">
        <tr>
 <td style="text-align: center; padding-right: 10px;" >
     <asp:GridView cssClass="table table-bordered" ID="GridView2" runat="server" DataSourceID="SqlDataSource_vyber" AutoGenerateColumns="False" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id_user">
         <Columns>
             <asp:CommandField ShowSelectButton="True" />
             <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
             <asp:BoundField DataField="jmeno" HeaderText="Jméno redaktora" SortExpression="jmeno" />
             <asp:BoundField DataField="prijmeni" HeaderText="Příjmení redaktora" SortExpression="prijmeni" />
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
     <asp:SqlDataSource ID="SqlDataSource_vyber" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_user], [jmeno],[prijmeni] FROM [User] WHERE ([role] = 4)"></asp:SqlDataSource>
     <br />
     <asp:GridView cssClass="table table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource_AgendaRedaktor" AutoGenerateColumns="False" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
         <Columns>
             <asp:BoundField DataField="nadpis_clanku" HeaderText="Přidělený článek" SortExpression="nadpis_clanku" />
             <asp:BoundField DataField="nazev_stav_cit" HeaderText="Stav přiděleného článku" SortExpression="nazev_stav_cit" />
             <asp:BoundField DataField="jmeno" HeaderText="Jméno oponenta" SortExpression="jmeno" />
             <asp:BoundField DataField="prijmeni" HeaderText="Přijmení oponenta" SortExpression="prijmeni" />
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
     <asp:SqlDataSource ID="SqlDataSource_AgendaRedaktor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [User].jmeno,[User].prijmeni,[Clanek].nadpis_clanku,[Stav].nazev_stav_cit
FROM [User] JOIN [Propoj_clanek_oponent] ON ([User].id_user = [Propoj_clanek_oponent].oponent) JOIN [Clanek] ON([Clanek].id_clanek=[Propoj_clanek_oponent].clanek) JOIN Stav ON ([Clanek].stav=[Stav].id_stav)
WHERE prideleno=@prideleno">
         <SelectParameters>
             <asp:ControlParameter ControlID="GridView2" Name="prideleno" PropertyName="SelectedValue" />
         </SelectParameters>
     </asp:SqlDataSource>

    </table>
</asp:Content>

