<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pridat-clanek.aspx.cs" Inherits="Zadani_prispevku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Zadání příspěvku</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Vytvořte svůj příspěvek</h3>
    <div class="obsah">
        <div class="form-horizontal">
            <div class="form-group">
                <label for="nadpis_clanku" class="control-label col-sm-2" id="Label1">Název článku</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="form-control" ID="nadpis_clanku" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">

                <label for="obsah_clanku" class="control-label col-sm-2" id="Label3">Abstrakt</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="form-control col-sm-10" ID="obsah_aspektu" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="obsah_clanku" class="control-label col-sm-2" id="Label2">Obsah článku</label>
                <div class="col-sm-10">
                    <asp:TextBox CssClass="form-control col-sm-10" ID="obsah_clanku" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">

                <label for="kategorie" class="control-label col-sm-2" id="Label4">Vyberte kategorii</label>

                <div class="col-sm-10">
                    
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" Font-Names="Arial" ForeColor="Black" Width="390px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LogosPolytechnikosApollo13_dbConnectionString %>" SelectCommand="SELECT nazev FROM [Tema]"></asp:SqlDataSource>
                    
                </div>
            </div>
            <div class="form-group">

                <label for="soubory" class="control-label col-sm-2" id="Label5">Přídavné soubory</label>
                <div class="col-sm-10">
                    
                    <asp:Label ID="Label6" runat="server" Text="Soubor:"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="Black" />
                    <br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Smazat výběr" ForeColor="Black" />
                    
                &nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Nahrát soubor" />
                    
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button CssClass="btn btn-success" ID="Button1" runat="server" OnClick="Button1_Click" Text="Odeslat článek" />
                </div>
            </div>
            <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </div>
</asp:Content>
