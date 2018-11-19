<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pridelit-oponenta.aspx.cs" Inherits="redaktor_prideleni_oponenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
        }

        .auto-style2 {
            text-decoration: underline;
        }

        </style>
    <title>Přidělit oponenta</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h3 class="text-center">Přiřazení článku oponentovi</h3>

    <div class="row">
        <div class="col-sm-8">
              <span class="auto-style1"><strong><span class="auto-style2">
         <p>Vyber článek z tabulky:</p>
        </span></strong></span>
            
            <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_clanek" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                 <asp:TemplateField HeaderText="Operace">
                      <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button1" runat="server" CommandName="Select"/>
                            </ItemTemplate>

                            <HeaderStyle CssClass="text-center" />
                     </asp:TemplateField>
                    <asp:BoundField DataField="id_clanek" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" />
                    <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis" SortExpression="nadpis_clanku" />
                    <asp:BoundField DataField="obsah_clanku" HeaderText="Obsah" SortExpression="obsah_clanku" />
                    <asp:BoundField DataField="datum_clanku" HeaderText="Datum vložení" SortExpression="datum_clanku" />
                    <asp:BoundField DataField="autor" HeaderText="ID Autora" SortExpression="autor" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [obsah_clanku], [datum_clanku], [autor] FROM [Clanek] INNER JOIN [Stav] ON [Clanek].stav = [Stav].id_stav WHERE ([nazev_stav] = @nazev_stav)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="nema_oponenta" Name="nazev_stav" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <span class="auto-style1"><strong><span class="auto-style2">
           <p>Vybrané ID článku:&nbsp;<asp:Label ID="Label1_vybrany_clanek" runat="server" Font-Size="Medium"></asp:Label></p>
        </div>
        </span></strong></span>
           

        <div class="col-sm-4">
             <span class="auto-style1"><strong><span class="auto-style2">
          <p>Vyber oponenta ze seznamu:</p>
        </span></strong></span>
           
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="seznam_oponentu" DataTextField="cele_jmeno" DataValueField="id_user" Font-Size="Medium">
            </asp:DropDownList>
            <asp:SqlDataSource ID="seznam_oponentu" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT id_user,role,jmeno,prijmeni,(jmeno +' '+ prijmeni) AS [cele_jmeno] FROM [User] WHERE ([role] = @role)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="6" Name="role" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        
    </div>

    <div class="row">
        <div class="col-sm-12 text-center">
            <asp:Button CssClass="btn btn-lg btn-success" ID="Button1" Enabled="False" runat="server" OnClick="Button1_Click" Text="Potvrď výběr článku k oponentovi"/>
        </div>
    </div>

</asp:Content>

