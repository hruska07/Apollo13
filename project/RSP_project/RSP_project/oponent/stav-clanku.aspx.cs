using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class oponent_stav : System.Web.UI.Page
{
    Database DB = new Database();
    SqlConnection conn = null;
    Notifications nf = new Notifications();

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "oponent"))
            Response.Redirect("/login");
        conn = DB.getConnection();
    }

    protected void Button_aktualizovat_Click(object sender, EventArgs e)
    {
        try
        {
            DB.aktualizovatStavClanku(int.Parse(GridView1.SelectedValue.ToString()), int.Parse(DropDownList1.SelectedValue));

            //notifikace - mail
            DataRow clanek = DB.getClanekById(Convert.ToInt32(GridView1.SelectedValue.ToString()));
            DataRow user = DB.getUserById(Convert.ToInt32(clanek["autor"].ToString()));
            string message = "Stav vašeho článku '" + clanek["nadpis_clanku"] + "' byl změněn. Aktuální stav: " + DropDownList1.SelectedItem.Text;
            nf.sendEmail(user["email"].ToString(), "Článek - změna stavu", message);
            //notifikace - stranky
            DB.insertNotification(int.Parse(clanek["autor"].ToString()), int.Parse(clanek["id_clanek"].ToString()), "clanek_zmena_stavu", message);

            Response.Redirect(Request.RawUrl);
        }
        catch (Exception)
        {
            Label_message.Visible = true;
            Label_message.ForeColor = System.Drawing.Color.Red;
            Label_message.Text = "Chyba! Kontaktujte programátora.";
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.SelectedValue = GridView1.DataKeys[GridView1.SelectedIndex]["id_stav"].ToString();
        Button_aktualizovat.Enabled = true;
        Button1.Enabled = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_stav=1;

        SqlCommand delete = new SqlCommand("delete from Propoj_clanek_oponent where ([clanek]=@clanek)", conn);
        delete.Parameters.AddWithValue("@clanek",GridView1.SelectedValue);
        delete.ExecuteNonQuery();
        SqlCommand update = new SqlCommand("update Clanek set stav=@id_stav Where id_clanek=@clanek", conn);
        update.Parameters.AddWithValue("@id_stav", id_stav);
        update.Parameters.AddWithValue("@clanek", GridView1.SelectedValue);
       update.ExecuteNonQuery();
        Response.Redirect(Request.RawUrl);
    }
}