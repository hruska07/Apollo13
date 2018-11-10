<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Agenda_Redakor.aspx.cs" Inherits="Agenda_Redakor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="text-center"><asp:Label ID="Label_nadpis" runat="server" Text="Agenda Redaktora"></asp:Label></h2>
    <table style="width:100%;" border="0">
        <tr>
 <td style="text-align: right; padding-right: 10px;" >
     <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource_AgendaRedaktor" AutoGenerateColumns="False">
         <Columns>
             <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
             <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
             <asp:BoundField DataField="clanek" HeaderText="clanek" SortExpression="clanek" />
             <asp:BoundField DataField="oponent" HeaderText="oponent" SortExpression="oponent" />
         </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource_AgendaRedaktor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="Propoj_redaktor_clanek" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </table>
</asp:Content>

