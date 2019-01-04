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

            DataRow posudek = DB.getPosudekByClanekAOponent(id_clanek, int.Parse(Session["id_user"].ToString()));
            if (posudek == null)
            {
                Label_uvod.Text = "Níže prosím ohodnoťte článek";
            }
            else
            {
                Label_uvod.Text = "Vaše zadané hodnocení";
                Button_odeslat.Visible = false;
                DropDownList_kriterium1.SelectedValue = posudek["kriterium1"].ToString();
                DropDownList_kriterium1.Enabled = false;
                DropDownList_kriterium2.SelectedValue = posudek["kriterium2"].ToString();
                DropDownList_kriterium2.Enabled = false;
                DropDownList_kriterium3.SelectedValue = posudek["kriterium3"].ToString();
                DropDownList_kriterium3.Enabled = false;
                textbox_namety_k_diskuzi.Text = posudek["namety_k_diskuzi"].ToString();
                textbox_namety_k_diskuzi.Enabled = false;
                DropDownList_souhrnne_vyjadreni.SelectedValue = posudek["souhrnne_vyjadreni"].ToString();
                DropDownList_souhrnne_vyjadreni.Enabled = false;
                string komentar = posudek["doplnujici_komentar"].ToString();
                if (komentar != "")
                {
                    Panel_doplnujici_komentar.Visible = true;
                    textbox_doplnujici_komentar.Text = komentar;
                }
            }
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
                DB.aktualizovatStavClanku(id_clanek, "ma_posudek");
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
                

                Session["flashMsgType"] = "success";
                Session["flashMsgText"] = "Hodnocení bylo úspěšně odesláno";
            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Nastala chyba! Kontaktujte programátory. Text chyby: " + ex.Message;
            }

            Response.Redirect("/oponent/pridelene-clanky");
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Pole 'náměty k diskuzi' nesmí být prázdné.";
        }
        Response.Redirect(Request.RawUrl);
    }
}