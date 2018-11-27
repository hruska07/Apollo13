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
                &nbsp;<div class="col-sm-10">
                </div>
            </div>
            <div class="form-group">

                <label for="kategorie" class="control-label col-sm-2" id="Label4">Vyberte kategorii</label>

                <div class="col-sm-10">
                    
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" Font-Names="Arial" ForeColor="Black" Width="390px" DataTextField="Tema_pk" DataValueField="Tema_pk">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Tema_pk] FROM [Tema]"></asp:SqlDataSource>
                    
                </div>
            </div>
            <div class="form-group">

                <label for="soubory" class="control-label col-sm-2" id="Label5">Přídavné soubory</label>
                <div class="col-sm-10">
                    
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Soubor:"></asp:Label>
                                <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="Black" />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Smazat výběr" ForeColor="Black" />
                            </td>
                        </tr>
                    </table>            
                    <br />
                    <br />
                
                                        
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
