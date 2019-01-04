<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="helpdesk.aspx.cs" Inherits="helpdesk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h3>Helpdesk</h3>
     <div class="obsah">
           <div class="text-center">
    <p>
        Jméno:</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
    </p>
    <p>
        Email:</p>
    <p>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>

    <br />
    Dotaz:<br />
               <br />
    <asp:TextBox ID="TextBox3" runat="server" Height="173px" TextMode="MultiLine" Width="95%"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Odeslat dotaz" OnClick="Button1_Click" />
               </div></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" Runat="Server">
</asp:Content>

