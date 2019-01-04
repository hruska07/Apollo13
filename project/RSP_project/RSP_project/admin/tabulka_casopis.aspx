<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tabulka_casopis.aspx.cs" Inherits="tabulka_dat" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tabulka dat</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_casopis" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id_casopis" HeaderText="id_casopis" InsertVisible="False" ReadOnly="True" SortExpression="id_casopis" />
            <asp:BoundField DataField="tema" HeaderText="tema" SortExpression="tema" />
            <asp:BoundField DataField="datum_uzaverky" HeaderText="datum_uzaverky" SortExpression="datum_uzaverky" />
            <asp:BoundField DataField="datum_vydani" HeaderText="datum_vydani" SortExpression="datum_vydani" />
            <asp:BoundField DataField="kapacita" HeaderText="kapacita" SortExpression="kapacita" />
            <asp:CheckBoxField DataField="cislo_uzavreno" HeaderText="cislo_uzavreno" SortExpression="cislo_uzavreno" />
            <asp:BoundField DataField="oznaceni" HeaderText="oznaceni" SortExpression="oznaceni" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RSPproject20181213121427_dbConnectionString %>" SelectCommand="SELECT * FROM [Casopis]"></asp:SqlDataSource>
</asp:Content>



