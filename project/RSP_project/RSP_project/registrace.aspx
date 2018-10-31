﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registrace.aspx.cs" Inherits="registrace" %>

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
                        </td>
                    </tr>
                                        <tr>
                        <td style="width: 50%; text-align: right; padding-right: 10px;">Zadejte email</td>
                        <td style="width: 50%; text-align: left; padding-left: 10px;">
                            <asp:TextBox ID="TextBox_email" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                                        <tr>
                        <td style="width: 50%; text-align: right; padding-right: 10px;">Zadejte jméno</td>
                        <td style="width: 50%; text-align: left; padding-left: 10px;">
                            <asp:TextBox ID="TextBox_jmeno" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                                        <tr>
                        <td style="width: 50%; text-align: right; padding-right: 10px;">Zadejte příjmení</td>
                        <td style="width: 50%; text-align: left; padding-left: 10px;">
                            <asp:TextBox ID="TextBox_prijmeni" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 10px;" class="auto-style1">Zadejte heslo</td>
                        <td style="text-align: left; padding-left: 10px;" class="auto-style1">
                            <asp:TextBox ID="TextBox_password1" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 10px;" class="auto-style1">Zadejte heslo znovu</td>
                        <td style="text-align: left; padding-left: 10px;" class="auto-style1">
                            <asp:TextBox ID="TextBox_password2" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="text-center">
                        <td colspan="2">
                            <br />
                            <asp:Button CssClass="btn btn-success" ID="Button_login" runat="server" Text="Vytvořit" OnClick="Button_login_Click" />
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