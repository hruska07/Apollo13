<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="stav.aspx.cs" Inherits="oponent_stav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FFFF00;
        }
        .auto-style2 {
            text-decoration: underline;
        }
        .auto-style3 {
            color: #FEFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="text-center"><span class="auto-style3"><br /><br />
       <strong><span class="auto-style2">Vyberte článek:</span><br class="auto-style2" /></strong><br />
       </span>
       <span class="auto-style1">
    <asp:GridView ID="GridView1" CssClass="table table-dark table-striped table-borderless" runat="server" AutoGenerateColumns="False" DataSourceID="zdrojak" DataKeyNames="id_clanek,id_user,Id_propoj,id_stav" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="id_clanek" HeaderText="id_clanek" InsertVisible="False" ReadOnly="True" SortExpression="id_clanek" Visible="False" />
            <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
            <asp:BoundField DataField="Id_propoj" HeaderText="Id_propoj" SortExpression="Id_propoj" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:TemplateField HeaderText="Operace">
                  <ItemTemplate>
                                <asp:Button CssClass="btn btn-danger" Text="Vybrat" ID="select_button" runat="server" CommandName="Select" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="my-link" />

            </asp:TemplateField>
            <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" >
               <HeaderStyle CssClass="my-link" /> </asp:BoundField>
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" > <HeaderStyle CssClass="my-link" /></asp:BoundField>
            <asp:BoundField DataField="nadpis_clanku" HeaderText="Nadpis článku" SortExpression="nadpis_clanku" ><HeaderStyle CssClass="my-link" /> </asp:BoundField>
            <asp:BoundField DataField="datum_clanku" HeaderText="Datum článku" SortExpression="datum_clanku" ><HeaderStyle CssClass="my-link" /></asp:BoundField>
            <asp:BoundField DataField="Stav" HeaderText="Stav" SortExpression="Stav" Visible="False" ><HeaderStyle CssClass="my-link" /></asp:BoundField>
            <asp:BoundField DataField="nazev_stav" HeaderText="Stav" SortExpression="nazev_stav" ><HeaderStyle CssClass="my-link" /></asp:BoundField>
            <asp:BoundField DataField="id_stav" HeaderText="id_stav" InsertVisible="False" ReadOnly="True" SortExpression="id_stav" Visible="False" ><HeaderStyle CssClass="my-link" /></asp:BoundField>
        </Columns>
    </asp:GridView> <div class="text-center">
    <asp:SqlDataSource ID="zdrojak" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" SelectCommand="SELECT [Clanek].id_clanek,[User].id_user,[Propoj_clanek_oponent].Id_propoj,[User].jmeno,[User].prijmeni,[Clanek].nadpis_clanku,[Clanek].datum_clanku,[Clanek].Stav,[Stav].nazev_stav,[Stav].id_stav  FROM Propoj_clanek_oponent JOIN [Clanek] ON clanek=id_clanek JOIN [User] ON autor=id_user JOIN [Stav] ON [Clanek].stav=[Stav].id_stav WHERE ([oponent]=11)"></asp:SqlDataSource>
    <br />
    <br />

  

       </span>

  

    <div class="text-center">
            <span class="auto-style2">
                <strong>Změnit stav zvoleného článku na:<span class="auto-style1"><br />

  

       </span>

  

            </strong></span>
       <span class="auto-style1">
                <strong> 
            <span class="auto-style1">
                <em>1 - Nemá oponenta<br />
                    2 - Má oponenta<br />
                    3 - Čeká na posudek<br />
                    4 - Schválen<br />
                    5 - Zamítnut<br />
                    6 - Zveřejněn<br />
            <br />
    </div>
                </em>
            <asp:FormView ID="FormView1" CssClass="table table-dark table-striped table-borderless" runat="server" DataKeyNames="id_clanek" DataSourceID="SqlDataSource1" DefaultMode="Edit" HorizontalAlign="Center" OnItemUpdated="zmena" OnPageIndexChanging="FormView1_PageIndexChanging">
                <EditItemTemplate>
                    id_clanek:
                    <asp:Label ID="id_clanekLabel1" runat="server" Text='<%# Eval("id_clanek") %>' />
                    <br />
                    stav:
                    <asp:TextBox ID="stavTextBox" runat="server" Text='<%# Bind("stav") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" cssClass="btn btn-danger mt-1"  runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizovat" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" cssClass="btn btn-danger mt-1"  runat="server" CausesValidation="False" CommandName="Cancel" Text="Storno" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    stav:
                    <asp:TextBox ID="stavTextBox" runat="server" Text='<%# Bind("stav") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Vložit" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Storno" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id_clanek:
                    <asp:Label ID="id_clanekLabel" runat="server" Text='<%# Eval("id_clanek") %>' />
                    <br />
                    stav:
                    <asp:Label ID="stavLabel" runat="server" Text='<%# Bind("stav") %>' />
                    <br />

                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Upravit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Odstranit" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nový" />

                </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString_seznam_volnych_clanku %>" DeleteCommand="DELETE FROM [Clanek] WHERE [id_clanek] = @original_id_clanek AND [stav] = @original_stav" InsertCommand="INSERT INTO [Clanek] ([stav]) VALUES (@stav)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id_clanek], [stav] FROM [Clanek] WHERE ([id_clanek] = @id_clanek)" UpdateCommand="UPDATE [Clanek] SET [stav] = @stav WHERE [id_clanek] = @original_id_clanek AND [stav] = @original_stav">
        <DeleteParameters>
            <asp:Parameter Name="original_id_clanek" Type="Int32" />
            <asp:Parameter Name="original_stav" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="stav" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id_clanek" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="stav" Type="Int32" />
            <asp:Parameter Name="original_id_clanek" Type="Int32" />
            <asp:Parameter Name="original_stav" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
            </span>
        </strong>
    <br />

  

       </span>

  

</asp:Content>

