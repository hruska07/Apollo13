<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tabulka_user.aspx.cs" Inherits="tabulka_dat" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tabulka dat</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="SqlDataSource1" AllowSorting="True" Width="527px">
        <Columns>
            <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" />
            <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
            <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RSPproject20181213121427_dbConnectionString %>" SelectCommand="SELECT * FROM [User]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [User] WHERE [id_user] = @original_id_user AND [jmeno] = @original_jmeno AND [prijmeni] = @original_prijmeni AND [login] = @original_login AND [password] = @original_password AND (([role] = @original_role) OR ([role] IS NULL AND @original_role IS NULL)) AND [email] = @original_email" InsertCommand="INSERT INTO [User] ([jmeno], [prijmeni], [login], [password], [role], [email]) VALUES (@jmeno, @prijmeni, @login, @password, @role, @email)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [User] SET [jmeno] = @jmeno, [prijmeni] = @prijmeni, [login] = @login, [password] = @password, [role] = @role, [email] = @email WHERE [id_user] = @original_id_user AND [jmeno] = @original_jmeno AND [prijmeni] = @original_prijmeni AND [login] = @original_login AND [password] = @original_password AND (([role] = @original_role) OR ([role] IS NULL AND @original_role IS NULL)) AND [email] = @original_email">
        <DeleteParameters>
            <asp:Parameter Name="original_id_user" Type="Int32" />
            <asp:Parameter Name="original_jmeno" Type="String" />
            <asp:Parameter Name="original_prijmeni" Type="String" />
            <asp:Parameter Name="original_login" Type="String" />
            <asp:Parameter Name="original_password" Type="String" />
            <asp:Parameter Name="original_role" Type="Int32" />
            <asp:Parameter Name="original_email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="jmeno" Type="String" />
            <asp:Parameter Name="prijmeni" Type="String" />
            <asp:Parameter Name="login" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="role" Type="Int32" />
            <asp:Parameter Name="email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="jmeno" Type="String" />
            <asp:Parameter Name="prijmeni" Type="String" />
            <asp:Parameter Name="login" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="role" Type="Int32" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="original_id_user" Type="Int32" />
            <asp:Parameter Name="original_jmeno" Type="String" />
            <asp:Parameter Name="original_prijmeni" Type="String" />
            <asp:Parameter Name="original_login" Type="String" />
            <asp:Parameter Name="original_password" Type="String" />
            <asp:Parameter Name="original_role" Type="Int32" />
            <asp:Parameter Name="original_email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>



