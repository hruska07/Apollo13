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
        int pridelil = int.Parse(Session["id_user"].ToString());
        
        try
        {
            DB.pridelOponenty(id_clanek, datum_vyrizeni, oponent, oponent2, pridelil);

            //notifikace - mail - autor
            DataRow clanek = DB.getClanekById(Convert.ToInt32(GridView1.SelectedValue.ToString()));
            DataRow user = DB.getUserById(Convert.ToInt32(clanek["autor"].ToString()));
            string message = "Stav vašeho článku '" + clanek["nadpis_clanku"] + "' byl změněn, byl přidělen oponent. Aktuální stav: Čeká na posudek";
            nf.sendEmail(user["email"].ToString(), "Článek - změna stavu", message);
            //notifikace - stranky - autor
            DB.insertNotification(int.Parse(clanek["autor"].ToString()), message);

            //notifikace - mail (oponenti)
            string message2 = "K recenzi Vám byl přidělen nový článek: " + clanek["nadpis_clanku"];
            DataRow oponent1_DB = DB.getUserById(oponent);
            DataRow oponent2_DB = DB.getUserById(oponent2);
            nf.sendEmail(oponent1_DB["email"].ToString(), "Recenzní řízení - nový článek", message2);
            nf.sendEmail(oponent2_DB["email"].ToString(), "Recenzní řízení - nový článek", message2);

            //notifikace - stranky (oponenti)
            DB.insertNotification(oponent, message2);
            DB.insertNotification(oponent2, message2);

            Session["flashMsgType"] = "success";
            Session["flashMsgText"] = "Oponenti byli úspěšně přiděleni";
        }
        catch (Exception ex)
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Chyba při ukládání dat do databáze. Kontaktujte vývojáře.";
        }

        Response.Redirect("/redaktor/pridelit-oponenta");

    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Label1_vybrany_clanek.Text = GridView1.SelectedValue.ToString();
        Button1.Enabled = true;
    }
}
