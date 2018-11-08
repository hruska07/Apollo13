<%@ Page Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="text-center">
        <asp:Label ID="Label_nadpis" runat="server" Text="Přihlášení"></asp:Label></h2>
    <table style="width: 100%;">
        <tr>
            <td class="login-cell-left">Login</td>
            <td class="login-cell-right">
                <asp:TextBox ID="TextBox_login" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="login-cell-left">Heslo</td>
            <td class="login-cell-right">
                <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr class="text-center">
            <td colspan="2">
                <br />
                <asp:Button CssClass="btn btn-success" ID="Button_login" runat="server" Text="Přihlásit se" OnClick="Button_login_Click" />
                <br />
                <br />
                <asp:Label ID="Label_output" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
