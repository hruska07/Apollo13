<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="redaktor_prideleni_oponenta.aspx.cs" Inherits="redaktor_prideleni_oponenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="seznam_volnych_clanku" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
                        <asp:BoundField DataField="obsah_clanku" HeaderText="obsah_clanku" SortExpression="obsah_clanku" />
                        <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
                        <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" />
                        <asp:CheckBoxField DataField="ma_oponenta" HeaderText="ma_oponenta" SortExpression="ma_oponenta" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="seznam_volnych_clanku" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Clanek] WHERE ([ma_oponenta] = @ma_oponenta)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="false" Name="ma_oponenta" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="seznam_oponentu" DataTextField="cele_jmeno" DataValueField="id_user">
                </asp:DropDownList>
                <asp:SqlDataSource ID="seznam_oponentu" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT id_user,role,jmeno,prijmeni,(jmeno +' '+ prijmeni) AS [cele_jmeno] FROM [User] WHERE ([role] = @role)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="6" Name="role" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Vybrané ID článku:
                <asp:Label ID="Label1_vybrany_clanek" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

