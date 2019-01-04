﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tabulka_clanek.aspx.cs" Inherits="tabulka_dat" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tabulka dat</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_clanek" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
            <asp:BoundField DataField="nadpis_clanku" HeaderText="nadpis_clanku" SortExpression="nadpis_clanku" />
            <asp:BoundField DataField="datum_clanku" HeaderText="datum_clanku" SortExpression="datum_clanku" />
            <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
            <asp:BoundField DataField="stav" HeaderText="stav" SortExpression="stav" />
            <asp:BoundField DataField="casopis" HeaderText="casopis" SortExpression="casopis" />
            <asp:BoundField DataField="soubor" HeaderText="soubor" SortExpression="soubor" />
            <asp:BoundField DataField="abstrakt" HeaderText="abstrakt" SortExpression="abstrakt" />
            <asp:BoundField DataField="keywords" HeaderText="keywords" SortExpression="keywords" />
            <asp:BoundField DataField="autors" HeaderText="autors" SortExpression="autors" />
            <asp:BoundField DataField="workplace" HeaderText="workplace" SortExpression="workplace" />
            <asp:BoundField DataField="path" HeaderText="path" SortExpression="path" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RSPproject20181213121427_dbConnectionString %>" SelectCommand="SELECT * FROM [Clanek]"></asp:SqlDataSource>
</asp:Content>



