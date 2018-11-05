<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zadani_prispevku.aspx.cs" Inherits="Zadani_prispevku" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Zadání příspěvku</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
       body
       {
           margin: 20px 20px 20px 20px;
       }
        #Button1
        {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #4CAF50;
            color: greenyellow;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px 4px 7px;
            cursor: pointer;
        }
        #Button1:hover
        {
            background-color:aquamarine;
            border: none;
            color:darkblue;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div class="jumbotron text-center">
                 <h1>Vytvořte svůj příspěvek</h1>
            </div>


     &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Zde vložte název článku"></asp:Label>
            <br />
         <br />
         &nbsp;<asp:TextBox ID="nadpis_clanku" runat="server" Height="32px" OnTextChanged="TextBox1_TextChanged" Width="680px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Zde vložte obsah článku"></asp:Label>
            <br />
         <br />
            <asp:TextBox ID="obsah_clanku" runat="server" Height="251px" TextMode="MultiLine" Width="951px" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <br />
            <br />
         <br />
         &nbsp;</div><asp:Button ID="Button1" runat="server" Height="47px" OnClick="Button1_Click" Text="Odeslat článek" Width="177px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
            </form><p>
                &nbsp;</p>
</body>
</html>
