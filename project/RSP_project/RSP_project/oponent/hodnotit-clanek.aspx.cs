using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection conn = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    Database DB = new Database();
    Notifications nf = new Notifications();
    int id_clanek;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB.getConnection();

        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "oponent"))
            Response.Redirect("/login");

        if (Request.RawUrl.ToString().Contains("/oponent/hodnotit-clanek?c=") && Request.RawUrl.ToString() != "/oponent/hodnotit-clanek?c=")
        {
            string a = Request.RawUrl.ToString();
            id_clanek = Convert.ToInt32(Request.Params["c"]);
            DataRow clanek = DB.getClanekById(id_clanek);
            Label_nadpis.Text = clanek["nadpis_clanku"].ToString();
            Label_datum.Text = clanek["datum_clanku"].ToString();
            Label_keywords.Text = clanek["keywords"].ToString();
            Label_abstrakt.Text = clanek["abstrakt"].ToString();
            Label_autor.Text = clanek["autors"].ToString();
            Label_pracoviste.Text = clanek["workplace"].ToString();
        }
        else
        {
            Response.Redirect("/oponent/pridelene-clanky");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataRow clanek = DB.getClanekById(id_clanek);
        string path = clanek["path"].ToString();
        string name = clanek["nadpis_clanku"].ToString();

        if (path != "")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("content-disposition", "filename=" + path);
            Response.TransmitFile(Server.MapPath("~/Saved_files/") + path);
            Response.End();
        }

    }

    protected void Button_odeslat_Click(object sender, EventArgs e)
    {
        if (validator_namety_k_diskuzi.IsValid)
        {

            char kriterium1 = char.Parse(DropDownList_kriterium1.SelectedValue);
            char kriterium2 = char.Parse(DropDownList_kriterium2.SelectedValue);
            char kriterium3 = char.Parse(DropDownList_kriterium2.SelectedValue);
            string namety_k_diskuzi = textbox_namety_k_diskuzi.Text;
            int souhrnne_vyjadreni = int.Parse(DropDownList_souhrnne_vyjadreni.SelectedValue);

            try
            {
                DB.odeslatPosudek(namety_k_diskuzi, kriterium1, kriterium2, kriterium3, souhrnne_vyjadreni, id_clanek, int.Parse(Session["id_user"].ToString()));

                //notifikace - redakce
                DataRow clanek = DB.getClanekById(id_clanek);
                string message = "Bylo vloženo nové hodnocení článku '" + clanek["nadpis_clanku"] + "'";

                //DataTable users = DB.getRedaktori();
                DataTable users = DB.getRedaktori();
                foreach (DataRow user in users.Rows)
                {
                    DB.insertNotification(int.Parse(user["id_user"].ToString()), message);
                    nf.sendEmail(user["email"].ToString(), "Článek - změna stavu", message);
                }
                DB.aktualizovatStavClanku(id_clanek, "ma_posudek");

                Session["flashMsgType"] = "success";
                Session["flashMsgText"] = "Hodnocení bylo úspěšně odesláno";
            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Nastala chyba! Kontaktujte programátory. Text chyby: " + ex.Message;
                Response.Redirect(Request.RawUrl);
            }

            /* ZDE JE POTREBA PROVEST JESTE NEKOLIK VECI, A TO:
             * 1) ZMĚNIT STAV ČLÁNKU NA "MÁ POSUDEK" (NEBO NA NOVÝ STAV "V RECENZNÍM ŘÍZENÍ"???)
             * 2) NOTIFIKOVAT REDAKTORA O NOVÉM POSUDKU 
             *      - ZÁROVEŇ BY TO CHTĚLO U REDAKTORA VYŘEŠIT ZPŘÍSTUPŇOVÁNÍ POSUDKŮ AUTOROVI ČLÁNKU - POKUD JSOU JIŽ POSUDKY 2??
             *      - ZÁROVEŇ POKUD BYL ČLÁNEK PŘIJAT/ZAMÍTNUT S VÝHRADAMI, UMOŽNIT AUTOROVI ČLÁNEK ZMĚNIT
             *      - ZÁROVEŇ UMOŽNIT REDAKTOROVI PŘI ZAMÍTNUTÍ ČLÁNKU VYŘADIT ČLÁNEK Z ČÍSLA ČASOPISU
             */

            Response.Redirect("/oponent/pridelene-clanky");
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Pole 'náměty k diskuzi' nesmí být prázdné.";
        }
    }
}