<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pridat-clanek.aspx.cs" Inherits="Zadani_prispevku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Zadání příspěvku</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Vytvořte svůj příspěvek</h3>
    <div class="obsah">
        <div class="row">
        <div class="col-sm-12">
            <div class="form-group row">
                <label for="nadpis_clanku" class="col-form-label col-sm-1" id="Label1">Název článku</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="nadpis_clanku" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label for="obsah_aspektu" class="col-form-label col-sm-1" id="Label3">Abstrakt</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="obsah_aspektu" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label for="kategorie" class="col-form-label col-sm-1" id="Label4">Kategorie</label>
                <div class="col-sm-11">            
                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" Font-Names="Arial" ForeColor="Black" Width="390px" DataTextField="Tema_pk" DataValueField="Tema_pk">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Tema_pk] FROM [Tema]"></asp:SqlDataSource>    
                </div>
            </div>
            <div class="form-group row">
                <asp:Label class="col-form-label col-sm-1" ID="Label6" runat="server" Text="Soubor"></asp:Label>
                <div class="col-sm-11">                   
                    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                </div>
            </div>
            <div class="form-group row">
                <label for="klicova_slova" class="col-form-label col-sm-1" id="Label10">Klíčová slova</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="keywords" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label for="autori" class="col-form-label col-sm-1" id="Label11">Autoři</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="autors" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label for="pracoviste" class="col-form-label col-sm-1" id="Label12">Pracoviště</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="workplace" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-1"></div>
                <div class="col-sm-11">
                    <asp:Button CssClass="btn btn-danger mt-3" ID="Button1" runat="server" OnClick="Button1_Click" Text="Odeslat článek" />
                </div>
            </div>
            <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
            </div>
    </div>
</asp:Content>
