using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class oponent_stav : System.Web.UI.Page
{
    Database DB = new Database();
    Notifications nf = new Notifications();

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "redaktor"))
            Response.Redirect("/login");
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
            DB.insertNotification(int.Parse(clanek["autor"].ToString()), int.Parse(clanek["id_clanek"].ToString()), "info", message);

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
    }
}