<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registrace.aspx.cs" Inherits="registrace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="my-form form-horizontal">
        <fieldset>
            <legend>&nbsp;Uživatelské údaje&nbsp;</legend>
            <div class="form-group">
                <asp:textbox placeholder="Login" id="TextBox_login" cssclass="form-control" runat="server"></asp:textbox>
                <asp:requiredfieldvalidator id="validator_login" runat="server" errormessage="Login musí být zadané" controltovalidate="TextBox_login" display="Dynamic"></asp:requiredfieldvalidator>
            </div>
            <div class="form-group">
                <asp:textbox placeholder="E-mail" id="TextBox_email" cssclass="form-control" runat="server"></asp:textbox>
                <asp:requiredfieldvalidator id="validator_email" runat="server" errormessage="Email musí být zadané" controltovalidate="TextBox_email" display="Dynamic"></asp:requiredfieldvalidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator_email" runat="server" ControlToValidate="TextBox_email" Display="Dynamic" ErrorMessage="Email ve špatném tvaru" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:textbox placeholder="Jméno" id="TextBox_jmeno" cssclass="form-control" runat="server"></asp:textbox>
                <asp:requiredfieldvalidator id="validator_jmeno" runat="server" errormessage="Jméno musí být zadané" controltovalidate="TextBox_jmeno" display="Dynamic"></asp:requiredfieldvalidator>
            </div>
            <div class="form-group">
                <asp:textbox placeholder="Příjmení" id="TextBox_prijmeni" cssclass="form-control" runat="server"></asp:textbox>
                <asp:requiredfieldvalidator id="validator_prijmeni" runat="server" errormessage="Příjmení musí být zadané" controltovalidate="TextBox_prijmeni" display="Dynamic"></asp:requiredfieldvalidator>
            </div>
            <div class="form-group">
                <asp:textbox placeholder="Heslo" id="TextBox_password1" cssclass="form-control" runat="server" textmode="Password"></asp:textbox>
                <asp:requiredfieldvalidator id="validator_heslo" runat="server" errormessage="Musíte zadat heslo" controltovalidate="TextBox_password1" display="Dynamic"></asp:requiredfieldvalidator>
            </div>
            <div class="form-group">
                <asp:textbox placeholder="Heslo znovu" id="TextBox_password2" cssclass="form-control" runat="server" textmode="Password"></asp:textbox>
                <asp:requiredfieldvalidator id="validator_heslo0" runat="server" errormessage="Musíte zadat heslo" controltovalidate="TextBox_password2" display="Dynamic"></asp:requiredfieldvalidator>
                <asp:comparevalidator id="CompareValidator_stejnaPW" runat="server" controltocompare="TextBox_password1" controltovalidate="TextBox_password2" display="Dynamic" errormessage="Zadaná hesla nejsou stejná"></asp:comparevalidator>
            </div>
            <div class="form-group">
                <label for="rbl_role">Role:&nbsp;</label>
                <asp:dropdownlist cssClass="form-control my-select" id="rbl_role" runat="server">
                        <asp:ListItem Value="autor" Selected="True">&nbsp;Autor</asp:ListItem>
                        <asp:ListItem Value="ostatni">&nbsp;Ostatní</asp:ListItem>
                </asp:dropdownlist>
                <br /><br />
                <p class="text-justify">Pokud se NECHCETE registrovat jako <b>autor</b>, vyberte roli <b>ostatní</b> a napište <a class="my-link" href="mailto:logospolytechnikos@gmail.com">email</a> administrátorovi. Ten vám poté přidělí požadovanou roli.</p>
            </div>
            <div class="text-center">
                <div class="form-group">
                    <div class="col-sm-12 text-center">
                        <asp:button cssclass="btn btn-danger" id="Button_register" runat="server" text="Vytvořit" onclick="Button_register_Click" />
                    </div>
                </div>
                <asp:label id="Label_output" runat="server" Visible="False"></asp:label>
                
                <asp:label id="Label_output2" runat="server" Visible="False"></asp:label>
            </div>
        </fieldset>
    </div>
</asp:Content>

    
