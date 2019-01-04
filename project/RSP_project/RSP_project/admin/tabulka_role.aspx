<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tabulka_role.aspx.cs" Inherits="tabulka_dat" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tabulka dat</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_role" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id_role" HeaderText="id_role" InsertVisible="False" ReadOnly="True" SortExpression="id_role" />
            <asp:BoundField DataField="nazev" HeaderText="nazev" SortExpression="nazev" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RSPproject20181213121427_dbConnectionString %>" SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource>
</asp:Content>



