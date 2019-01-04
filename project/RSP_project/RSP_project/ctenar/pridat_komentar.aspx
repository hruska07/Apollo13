<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pridat_komentar.aspx.cs" Inherits="Zadani_prispevku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Zadání příspěvku</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="obsah">
        <div class="row">
        <div class="col-sm-12">
            <div class="form-group row">
                <label for="nadpis_clanku" class="col-form-label col-sm-1" id="Label1">Název článku</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="nadpis_clanku" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label for="obsah_aspektu" class="col-form-label col-sm-1" id="Label3">Abstrakt</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="obsah_aspektu" runat="server" TextMode="MultiLine" Rows="10" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <label for="nadpis_komentu" class="col-form-label col-sm-1" id="Label4">Nadpis komentáře</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Enabled="True"></asp:TextBox>
                    <asp:requiredfieldvalidator id="validator_nadpis" runat="server" errormessage="Nadpis musí být zadaný" controltovalidate="TextBox1" display="Dynamic"></asp:requiredfieldvalidator>
                </div>
            </div>
            <div class="form-group row">
                <label for="obsah_komentu" class="col-form-label col-sm-1" id="Label5">Obsah komentáře</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" TextMode="MultiLine" Rows="10" Enabled="True"></asp:TextBox>
                    <asp:requiredfieldvalidator id="validator_obsah" runat="server" errormessage="Obsah musí být zadaný" controltovalidate="TextBox2" display="Dynamic"></asp:requiredfieldvalidator>
                </div>
            </div>
            <div class="form-group row">
                <label for="hodnoceni" class="col-form-label col-sm-1" id="Label6">Hodnocení</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" Enabled="True"></asp:TextBox>
                    <asp:requiredfieldvalidator id="validator_hodnoceni" runat="server" errormessage="Hodnocení musí být zadané" controltovalidate="TextBox3" display="Dynamic"></asp:requiredfieldvalidator>
                </div>
            </div>
            <div class="form-group row">
            </div>
            <div class="form-group row">
                <div class="col-sm-11">
                    <asp:Button CssClass="btn btn-danger mt-3" ID="Button1" runat="server" OnClick="Button1_Click" Text="Odeslat názor" />
                </div>
            </div>
        </div>
            </div>
    </div>
</asp:Content>
