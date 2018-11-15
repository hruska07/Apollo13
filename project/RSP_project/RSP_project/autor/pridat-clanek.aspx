<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pridat-clanek.aspx.cs" Inherits="Zadani_prispevku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Zadání příspěvku</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Vytvořte svůj příspěvek</h3>
    <div class="obsah">
        <div class="form-horizontal">
            <div class="form-group">
                <label for="nadpis_clanku" class="control-label col-sm-1" id="Label1">Název článku</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control" ID="nadpis_clanku" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="obsah_clanku" class="control-label col-sm-1" id="Label2">Obsah článku</label>
                <div class="col-sm-11">
                    <asp:TextBox CssClass="form-control col-sm-10" ID="obsah_clanku" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-11">
                    <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" OnClick="Button1_Click" Text="Odeslat článek" />
                </div>
            </div>
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</asp:Content>
