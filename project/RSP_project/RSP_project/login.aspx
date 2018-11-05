<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Přihlášení</title>
     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" href="styles.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <h2 class="text-center"><asp:Label ID="Label_nadpis" runat="server" Text="Přihlášení"></asp:Label></h2>
                <table style="width:100%;">
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
        </div>
    </form>
</body>
</html>
