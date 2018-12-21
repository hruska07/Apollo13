using System;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

public partial class redaktor_prideleni_oponenta : System.Web.UI.Page
{
    Database DB = new Database();
    Notifications nf = new Notifications();

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "redaktor"))
            Response.Redirect("/login");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_clanek = (int)GridView1.SelectedValue;
        string datum_vyrizeni = textbox_datum.Text;
        int oponent = int.Parse(DropDownList1.SelectedValue);
        int oponent2 = int.Parse(DropDownList2.SelectedValue);
        
        try
        {
            DB.pridelOponenty(id_clanek, datum_vyrizeni, oponent, oponent2);
            Session["flashMsgType"] = "success";
            Session["flashMsgText"] = "Oponenti byli úspěšně přiděleni";

            //notifikace - mail
            DataRow clanek = DB.getClanekById(Convert.ToInt32(GridView1.SelectedValue.ToString()));
            DataRow user = DB.getUserById(Convert.ToInt32(clanek["autor"].ToString()));
            string message = "Stav vašeho článku '" + clanek["nadpis_clanku"] + "' byl změněn, byl přidělen oponent. Aktuální stav: Čeká na posudek";
            nf.sendEmail(user["email"].ToString(), "Článek - změna stavu", message);
            //notifikace - stranky
            DB.insertNotification(int.Parse(clanek["autor"].ToString()), int.Parse(clanek["id_clanek"].ToString()), "info", message);

            Response.Redirect("/redaktor/pridelit-oponenta");
        }
        catch (Exception ex)
        {
          Label1_vybrany_clanek.Text = "Chyba: " + ex.Message;
        }

    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Label1_vybrany_clanek.Text = GridView1.SelectedValue.ToString();
        Button1.Enabled = true;
    }
}
