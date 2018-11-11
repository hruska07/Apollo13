<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Agenda_Redakor.aspx.cs" Inherits="Agenda_Redakor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="text-center"><asp:Label ID="Label_nadpis" runat="server" Text="Agenda Redaktora"></asp:Label></h2>
    <table style="width:100%;" border="0">
        <tr>
 <td style="text-align: center; padding-right: 10px;" >
     <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource_AgendaRedaktor" AutoGenerateColumns="False" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
         <Columns>
             <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
             <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
             <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" />
             <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" />
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
     <asp:SqlDataSource ID="SqlDataSource_AgendaRedaktor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="Propoj_redaktor_clanek" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </table>
</asp:Content>

