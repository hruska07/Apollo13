<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tabulka_helpdesk.aspx.cs" Inherits="tabulka_dat" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tabulka dat</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="obsah_helpdesk" HeaderText="obsah_helpdesk" SortExpression="obsah_helpdesk" />
            <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:CheckBoxField DataField="vyrizeno" HeaderText="vyrizeno" SortExpression="vyrizeno" />
            <asp:BoundField DataField="odpoved" HeaderText="odpoved" SortExpression="odpoved" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RSPproject20181213121427_dbConnectionString %>" SelectCommand="SELECT * FROM [Helpdesk]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Helpdesk] WHERE [Id] = @original_Id AND (([obsah_helpdesk] = @original_obsah_helpdesk) OR ([obsah_helpdesk] IS NULL AND @original_obsah_helpdesk IS NULL)) AND (([jmeno] = @original_jmeno) OR ([jmeno] IS NULL AND @original_jmeno IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([vyrizeno] = @original_vyrizeno) OR ([vyrizeno] IS NULL AND @original_vyrizeno IS NULL)) AND (([odpoved] = @original_odpoved) OR ([odpoved] IS NULL AND @original_odpoved IS NULL))" InsertCommand="INSERT INTO [Helpdesk] ([obsah_helpdesk], [jmeno], [email], [vyrizeno], [odpoved]) VALUES (@obsah_helpdesk, @jmeno, @email, @vyrizeno, @odpoved)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Helpdesk] SET [obsah_helpdesk] = @obsah_helpdesk, [jmeno] = @jmeno, [email] = @email, [vyrizeno] = @vyrizeno, [odpoved] = @odpoved WHERE [Id] = @original_Id AND (([obsah_helpdesk] = @original_obsah_helpdesk) OR ([obsah_helpdesk] IS NULL AND @original_obsah_helpdesk IS NULL)) AND (([jmeno] = @original_jmeno) OR ([jmeno] IS NULL AND @original_jmeno IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([vyrizeno] = @original_vyrizeno) OR ([vyrizeno] IS NULL AND @original_vyrizeno IS NULL)) AND (([odpoved] = @original_odpoved) OR ([odpoved] IS NULL AND @original_odpoved IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_obsah_helpdesk" Type="String" />
            <asp:Parameter Name="original_jmeno" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_vyrizeno" Type="Boolean" />
            <asp:Parameter Name="original_odpoved" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="obsah_helpdesk" Type="String" />
            <asp:Parameter Name="jmeno" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="vyrizeno" Type="Boolean" />
            <asp:Parameter Name="odpoved" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="obsah_helpdesk" Type="String" />
            <asp:Parameter Name="jmeno" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="vyrizeno" Type="Boolean" />
            <asp:Parameter Name="odpoved" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_obsah_helpdesk" Type="String" />
            <asp:Parameter Name="original_jmeno" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_vyrizeno" Type="Boolean" />
            <asp:Parameter Name="original_odpoved" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>



