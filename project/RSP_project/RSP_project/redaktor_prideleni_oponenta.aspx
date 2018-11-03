<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="redaktor_prideleni_oponenta.aspx.cs" Inherits="redaktor_prideleni_oponenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
        .auto-style1 {
            width: 50%;
            height: 29px;
        }
   
        
        .auto-style2 {
            height: 27px;
        }
        .auto-style3 {
            width: 50%;
            height: 27px;
        }
   
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>   <h2 class="text-center"><asp:Label ID="Label_nadpis" runat="server" Text="Přiřazení článku oponentovi"></asp:Label></h2> </center>
    <table style="width:100%;" border="1">
        <tr>
 <td style="text-align: right; padding-right: 10px;" >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="seznam_volnych_clanku" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                        <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                        <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="seznam_volnych_clanku" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [obsah_clanku], [datum_clanku], [id_user] FROM [Clanek] WHERE ([ma_oponenta] = @ma_oponenta)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="ma_oponenta" Type="Boolean" />
                    </SelectParameters>
    
                </asp:SqlDataSource>
            </td>
           <td style="text-align: left; padding-left: 10px;" class="auto-style1">
              Vyber oponenta ze seznamu:
               <br />
                  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="seznam_oponentu" DataTextField="cele_jmeno" DataValueField="id_user" Font-Size="Medium">
                </asp:DropDownList>
                <asp:SqlDataSource ID="seznam_oponentu" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT id_user,role,jmeno,prijmeni,(jmeno +' '+ prijmeni) AS [cele_jmeno] FROM [User] WHERE ([role] = @role)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="6" Name="role" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
             
         
        </tr>
        <tr>
             <td style="text-align: left; padding-left: 10px;" class="auto-style2" >Vybrané ID článku:
                <asp:Label ID="Label1_vybrany_clanek" runat="server" Font-Size="Medium"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Potvrď výběr článku k oponentovi" Font-Size="Medium" />
            </td>
          
        </tr>
        
    </table>
</asp:Content>

