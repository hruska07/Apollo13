<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="helpdesk_zobrazeni.aspx.cs" Inherits="helpdesk_zobrazeni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Helpdesk dotazy</h3>
     <div class="obsah">
           <div class="text-center">
                 <p><b><asp:Label ID="Label3" runat="server" Text="Vyberte dotaz:" Font-Bold="True"></asp:Label></b></p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
        <Columns>
            <asp:TemplateField HeaderText="Operace">
                   <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                            </ItemTemplate>


            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="obsah_helpdesk" HeaderText="obsah_helpdesk" SortExpression="obsah_helpdesk" Visible="False" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:CheckBoxField DataField="vyrizeno" HeaderText="vyrizeno" SortExpression="vyrizeno" Visible="False" />
            <asp:BoundField DataField="odpoved" HeaderText="odpoved" SortExpression="odpoved" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Helpdesk] WHERE ([vyrizeno] = @vyrizeno)">
        <SelectParameters>
            <asp:Parameter DefaultValue="false" Name="vyrizeno" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
               <asp:Label ID="Label1" runat="server" Text="Obsah dotazu:" Visible="False" Font-Bold="True"></asp:Label>
               <br />
    <asp:TextBox ID="TextBox1" runat="server" Height="173px" Width="95%" Visible="False" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
    <br />
    <br />
    <br />
               <asp:Label ID="Label2" runat="server" Text="Odpověď:" Visible="False" Font-Bold="True"></asp:Label>
               <br />
    <asp:TextBox ID="TextBox2" runat="server" Height="173px" Width="95%" Visible="False" TextMode="MultiLine"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Odeslat" Visible="False" OnClick="Button1_Click" />
    <br />
               </div></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" Runat="Server">
</asp:Content>

