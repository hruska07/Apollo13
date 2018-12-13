<%@ Page Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="my-form form-horizontal">
        <fieldset>
            <legend>&nbsp;Přihlašovací údaje&nbsp;</legend>
        <div class="form-group">
            <asp:TextBox placeholder="Login" CssClass="form-control" ID="TextBox_login" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:TextBox placeholder="Heslo" CssClass="form-control" ID="TextBox_password" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <div class="col-sm-12 text-center">
                <asp:Button CssClass="btn btn-success" ID="Button_login" runat="server" Text="Přihlásit se" OnClick="Button_login_Click" />
            </div>
        </div>
        <asp:Label ID="Label_output" runat="server" Text="Label" Visible="False"></asp:Label>
        </fieldset>

        <br />
        <fieldset>
            <legend>&nbsp;Testovací účty&nbsp;</legend>
            <br />
            <div class="row">
                <div class="col-sm-6">
                    <p>Heslo:</p>
                    <br />
                    <p>Autor - login:</p>
                    <p>Redaktor - login:</p>
                    <p>Šéfredaktor - login:</p>
                </div>
                <div class="col-sm-6">
                    <p><b>123456</b></p>
                    <br />
                    <p><b>autor</b></p>
                    <p><b>redaktor</b></p>
                    <p><b>sefredaktor</b></p>
                </div>
            </div>
        </fieldset>
    </div>

</asp:Content>
