<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registrace.aspx.cs" Inherits="registrace" %>

<!DOCTYPE html>
<script runat="server">

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Přihlášení</title>
     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <!--<link rel="stylesheet" href="styles.css" type="text/css"/>-->
    <style type="text/css">
        .auto-style1 {
            width: 50%;
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <h2 class="text-center"><asp:Label ID="Label_nadpis" runat="server" Text="Registrace"></asp:Label></h2>
                <table style="width:100%;">
                    <tr>
                        <td style="width: 50%; text-align: right; padding-right: 10px;">Zadejte Login</td>
                        <td style="width: 50%; text-align: left; padding-left: 10px;">
                            <asp:TextBox ID="TextBox_login" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validator_login" runat="server" ErrorMessage="Login musí být zadané" ControlToValidate="TextBox_login" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                                        <tr>
                        <td style="width: 50%; text-align: right; padding-right: 10px;">Zadejte email</td>
                        <td style="width: 50%; text-align: left; padding-left: 10px;">
                            <asp:TextBox ID="TextBox_email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validator_email" runat="server" ErrorMessage="Email musí být zadané" ControlToValidate="TextBox_email" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                                        <tr>
                        <td style="width: 50%; text-align: right; padding-right: 10px;">Zadejte jméno</td>
                        <td style="width: 50%; text-align: left; padding-left: 10px;">
                            <asp:TextBox ID="TextBox_jmeno" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validator_jmeno" runat="server" ErrorMessage="Jméno musí být zadané" ControlToValidate="TextBox_jmeno" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                                        <tr>
                        <td style="width: 50%; text-align: right; padding-right: 10px;">Zadejte příjmení</td>
                        <td style="width: 50%; text-align: left; padding-left: 10px;">
                            <asp:TextBox ID="TextBox_prijmeni" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validator_prijmeni" runat="server" ErrorMessage="Příjmení musí být zadané" ControlToValidate="TextBox_prijmeni" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 10px;" class="auto-style1">Zadejte heslo</td>
                        <td style="text-align: left; padding-left: 10px;" class="auto-style1">
                            <asp:TextBox ID="TextBox_password1" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validator_heslo" runat="server" ErrorMessage="Musíte zadat heslo" ControlToValidate="TextBox_password1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator_stejnaPW" runat="server" ControlToCompare="TextBox_password2" ControlToValidate="TextBox_password1" Display="Dynamic" ErrorMessage="Zadaná hesla nejsou stejná"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 10px;" class="auto-style1">Zadejte heslo znovu</td>
                        <td style="text-align: left; padding-left: 10px;" class="auto-style1">
                            <asp:TextBox ID="TextBox_password2" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validator_heslo0" runat="server" ErrorMessage="Musíte zadat heslo" ControlToValidate="TextBox_password2" Display="Dynamic"></asp:RequiredFieldValidator>
                        &nbsp;</td>
                    </tr>
                      <tr>
                        <td style="text-align: right; padding-right: 10px;" class="auto-style1">Zvolte roli</td>
                        <td style="text-align: left; padding-left: 10px;" class="auto-style1">
                            <asp:RadioButtonList ID="rbl_role" runat="server" CellPadding="0" CellSpacing="1">
                                <asp:ListItem>Autor</asp:ListItem>
                                <asp:ListItem>Čtenář</asp:ListItem>
                                <asp:ListItem>Ostatní</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td colspan="2">
                            <br />
                            <asp:Button CssClass="btn btn-success" ID="Button_register" runat="server" Text="Vytvořit" OnClick="Button_register_Click" />
                            <br />
                            <br />
                            <asp:Label ID="Label_output" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="Label_output2" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>
