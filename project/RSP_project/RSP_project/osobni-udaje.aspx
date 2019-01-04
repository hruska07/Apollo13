<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="osobni-udaje.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Osobní údaje</h3>
    <div class="obsah">
        <div class="row">
            <div class="col-1">
                <div class="mb-2" style="height: 33px;">
                    Login:
                </div>
                <div class="my-4" style="height: 33px;">
                    Email:
                </div>
                <div class="my-4" style="height: 33px;">
                    Jméno:
                </div>
                <div class="my-4" style="height: 33px;">
                    Příjmení:
                </div>
                <div class="mt-4" style="height: 33px;">
                    Heslo:
                </div>
            </div>
            <div class="col-11">
                <div class="mb-2" style="height: 33px;">
                    <asp:Label ID="Label_login" runat="server" Text="Label"></asp:Label>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger" ID="Button_zmenit_login" runat="server" Text="Upravit" OnClick="Button_zmenit_login_Click"/>

                    <asp:textbox placeholder="Nový login" id="TextBox_login" cssclass="form-control my-form-element" runat="server" Visible="false"></asp:textbox>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-success align-baseline my-form-element" ID="Button_odeslat_login" runat="server" Text="Uložit" Visible="false" OnClick="Button_odeslat_login_Click"/>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger align-baseline my-form-element" ID="Button_login_zrusit" runat="server" Text="Zrušit" Visible="false" OnClick="Button_login_zrusit_Click"/>
                </div>
                <div class="my-4" style="height: 33px;">
                    <asp:Label ID="Label_email" runat="server" Text="Label">******</asp:Label>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger" ID="Button_zmenit_email" runat="server" Text="Upravit" OnClick="Button_zmenit_email_Click"/>

                    <asp:textbox placeholder="Nový email" id="TextBox_email" cssclass="form-control my-form-element" runat="server" Visible="false"></asp:textbox>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-success align-baseline my-form-element" ID="Button_odeslat_email" runat="server" Text="Uložit" Visible="false" OnClick="Button_odeslat_email_Click"/>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger align-baseline my-form-element" ID="Button_email_zrusit" runat="server" Text="Zrušit" Visible="false" OnClick="Button_email_zrusit_Click"/>
                </div>
                <div class="my-4" style="height: 33px;">
                    <asp:Label ID="Label_jmeno" runat="server" Text="Label"></asp:Label>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger" ID="Button_zmenit_jmeno" runat="server" Text="Upravit" OnClick="Button_zmenit_jmeno_Click"/>

                    <asp:textbox placeholder="Nové jméno" id="TextBox_jmeno" cssclass="form-control my-form-element" runat="server" Visible="false"></asp:textbox>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-success align-baseline my-form-element" ID="Button_odeslat_jmeno" runat="server" Text="Uložit" Visible="false" OnClick="Button_odeslat_jmeno_Click"/>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger align-baseline my-form-element" ID="Button_jmeno_zrusit" runat="server" Text="Zrušit" Visible="false" OnClick="Button_jmeno_zrusit_Click"/>
                </div>
                <div class="my-4" style="height: 33px;">
                    <asp:Label ID="Label_prijmeni" runat="server" Text="Label"></asp:Label>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger" ID="Button_zmenit_prijmeni" runat="server" Text="Upravit" OnClick="Button_zmenit_prijmeni_Click"/>

                    <asp:textbox placeholder="Nové příjmení" id="TextBox_prijmeni" cssclass="form-control my-form-element" runat="server" Visible="false"></asp:textbox>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-success align-baseline my-form-element" ID="Button_odeslat_prijmeni" runat="server" Text="Uložit" Visible="false" OnClick="Button_odeslat_prijmeni_Click"/>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger align-baseline my-form-element" ID="Button_prijmeni_zrusit" runat="server" Text="Zrušit" Visible="false" OnClick="Button_prijmeni_zrusit_Click"/>
                </div>
                <div class="mt-4" style="height: 33px;">
                    <asp:Label ID="Label_heslo" runat="server" Text="Label">******</asp:Label>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger" ID="Button_zmenit_heslo" runat="server" Text="Upravit" OnClick="Button_zmenit_heslo_Click"/>

                    <asp:textbox placeholder="Nové heslo" id="TextBox_heslo" cssclass="form-control my-form-element" runat="server" Visible="false" TextMode="Password"></asp:textbox>
                    <asp:textbox placeholder="Heslo znovu" id="TextBox_heslo2" cssclass="ml-2 form-control my-form-element" runat="server" Visible="false" TextMode="Password"></asp:textbox>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-success align-baseline my-form-element" ID="Button_odeslat_heslo" runat="server" Text="Uložit" Visible="false" OnClick="Button_odeslat_heslo_Click"/>
                    <asp:Button CssClass="ml-2 btn btn-sm btn-danger align-baseline my-form-element" ID="Button_heslo_zrusit" runat="server" Text="Zrušit" Visible="false" OnClick="Button_heslo_zrusit_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

