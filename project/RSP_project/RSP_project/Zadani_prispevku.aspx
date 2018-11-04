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
       
        #nazev
        {
            width:80%;
        }
        #prispevek
        {
            margin: 20px 20px;
            padding: 20px 20px 20px 20px;
            height:400px;
            width:90%;
            resize:none;
        }
        #tlacitko
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
        #tlacitko:hover
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


     <form id="formular">
         <input id="nazev" type="text" name="nadpis_clanku" placeholder="Zde napište název příspěvku">
         <br />
         <br />
         <textarea id="prispevek" name="obsah_clanku" form="formular" placeholder="Napiště obsah příspěvku do tohoto pole"></textarea>
         <br />
         <br />
         &nbsp;<input id="tlacitko" type="submit" name="Submit" style="float:right"></form>
    </div>
    </form>
</body>
</html>
