<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hodnotit-clanek.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Hodnotit článek</h3>
    <div class="obsah">
        <div class="card-body mt-0 py-0 pl-1">
            <h5 class="card-title mt-1">
                <asp:Label ID="Label_nadpis" runat="server" Text="Label"></asp:Label>
            </h5>
            <h6 class="card-subtitle mb-2">
                <span class="fa fa-calendar"></span>
                <asp:Label ID="Label_datum" runat="server" Text="Label"></asp:Label>
            </h6>
            <p class="card-text pt-2">
                Klíčová slova:<br />
                <asp:Label ID="Label_keywords" runat="server" Text="Label"></asp:Label>
            </p>
            <p class="card-text pt-2">
                Abstrakt:<br />
                <asp:Label ID="Label_abstrakt" runat="server" Text="Label"></asp:Label>
            </p>
            <asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Soubor" OnClick="Button1_Click" />

            &nbsp;<footer class="blockquote-footer mt-1 " style="color: #fff;">
                <asp:Label ID="Label_autor" runat="server" Text="Label"></asp:Label><br />
                Pracoviště:&nbsp;<asp:Label ID="Label_pracoviste" runat="server" Text="Label"></asp:Label>
            </footer>
        </div>

        <hr class="border-white" />
        <h4 class="mb-5">
            <asp:Label ID="Label_uvod" runat="server" Text="Label"></asp:Label></h4>

        <!-- ZDE BUDE FORM -->
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group row">
                    <label for="textbox_namety_k_diskuzi" class="col-form-label col-sm-2" id="Label1">Náměty k diskuzi</label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" ID="textbox_namety_k_diskuzi" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validator_namety_k_diskuzi" runat="server" ErrorMessage="Povinné pole" ControlToValidate="textbox_namety_k_diskuzi" Display="Dynamic" ForeColor="#FF6363"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="DropDownList_kriterium1" class="col-form-label col-sm-2" id="Label2">Struktura práce</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="DropDownList_kriterium1" runat="server">
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="DropDownList_kriterium2" class="col-form-label col-sm-2" id="Label3">Použité metody zpracování</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="DropDownList_kriterium2" runat="server">
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="DropDownList_kriterium3" class="col-form-label col-sm-2" id="Label4">Metody zhodnocení výsledků</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="DropDownList_kriterium3" runat="server">
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="DropDownList_souhrnne_vyjadreni" class="col-form-label col-sm-2" id="Label6">Souhrnné vyjádření</label>
                    <div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="DropDownList_souhrnne_vyjadreni" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="text_vyjadreni" DataValueField="id_vyjadreni">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT * FROM [Souhrnne_vyjadreni]"></asp:SqlDataSource>
                    </div>
                </div>
                <asp:Panel ID="Panel_doplnujici_komentar" runat="server" Visible="False">
                    <hr class="border-white" />
                    <div class="form-group row">
                        <label for="textbox_doplnujici_komentar" class="col-form-label col-sm-2" id="Label8">Komentář od redaktora</label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="textbox_doplnujici_komentar" runat="server" TextMode="MultiLine" Rows="10" Enabled="False"></asp:TextBox>
                        </div>
                    </div>
                </asp:Panel>

                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-10">
                        <asp:Button CssClass="btn btn-danger mt-3" ID="Button_odeslat" runat="server" Text="Odeslat hodnocení článku" OnClick="Button_odeslat_Click" />
                    </div>
                </div>
                <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
        </div>

    </div>

</asp:Content>

