<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="clanky.aspx.cs" Inherits="zpetna_vazba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Moje články</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Zveřejněné články</h3>
    <div class="obsah">
    
        <div class="text-center row">
            <div class="col-sm-12">
             
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="zdroj3_zpetna_vazba" DataKeyNames="id_clanek" OnRowCommand="GridView3_RowCommand">
                    <Columns>
                       
                        <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" SortExpression="id_clanek" InsertVisible="False" ReadOnly="True" Visible="False" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku" > <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="autor" HeaderText="Autor" SortExpression="autor" > <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="keywords" HeaderText="Klíčová slova" SortExpression="keywords" > <HeaderStyle CssClass="text-center" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Detail">
                        <ItemTemplate>
                            <asp:Button CssClass="btn btn-info" Text="Detail" ID="detail_button" runat="server" CausesValidation="false" CommandName="ShowDetail" CommandArgument='<%# Eval("id_clanek") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="zdroj3_zpetna_vazba" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [id_clanek], [nadpis_clanku], [autor], [keywords] FROM [Clanek] WHERE [stav] = 6 ORDER BY [datum_clanku]">
                    <SelectParameters>
                        <asp:SessionParameter Name="autor" SessionField="id_user" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="text-center row">
        </div>
    </div>

</asp:Content>

