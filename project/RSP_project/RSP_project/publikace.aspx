<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="publikace.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .obsah {
            display: inline-block;
             padding: 0 15px 15px 15px;
            background-color: rgba(0, 0, 0, 0.25);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="obsah">
        
        <h3>Jak publikovat</h3>
        <p>
            Pokud chcete přispět do časopisu LOGOS POLYTECHNIKOS, neváhejte se<a href="login.aspx"class="label label-info"> Přihlásit</a>, nebo <a href="registrace.aspx" class="label label-info"> Registrovat</a>.

        </p>
        <p>
            Jazyky, ve kterých lze publikovat:
            <ul>
                <li>angličtina</li>
                <li>čeština</li>
                <li>slovenština</li>
            </ul>
        </p>
        <p>
            <b>Termíny uzávěrek pro sběr příspěvků:</b>
            <ul>
                <li>4/2018 - elektrotechnika, informatika, matematika, cizí jazyky (31. 08. 2018)</li>
                <li>1/2019 - ošetřovatelství, porodní asistence a další zdravotnické obory (31. 10. 2018)</li>
                <li>2/2019 - ošetřovatelství, porodní asistence a další zdravotnické obory, sociologie, sport, psychologie, sociální práce (31. 03. 2019)</li>
                <li>3/2019 - ekonomika, management, marketing, statistika, operační výzkum, finanční matematika, pojišťovnictví, cestovní ruch, regionální rozvoj, veřejná správa (31. 05. 2019) </li>

            </ul>
        </p>
        <p>
            Pokud rozsah doručených příspěvků překročí kapacitu příslušného vydání, bude přijímání příspěvků ukončeno před uvedeným termínem.

Adresa pro odesílání příspěvků:<a href="mailto: logos@vspj.cz"> logos@vspj.cz</a>

            Adresa nakladatele: Vysoká škola polytechnická Jihlava, redakce LOGOS POLYTECHNIKOS, Tolstého 16, 586 01 Jihlava.
        </p>


    </div>

</asp:Content>

