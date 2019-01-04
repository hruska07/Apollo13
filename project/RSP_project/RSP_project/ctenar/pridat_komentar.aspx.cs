using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.IO;

public partial class Zadani_prispevku : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection conn = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    Database DB = new Database();
    int cislo_autora = 0;
    int id_casopisu = 0;
    bool upravuje = false;
    int cislo_clanku = -1;
    DataRow puv_clanek;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "ctenar"))
            Response.Redirect("/login");
        else
            cislo_autora = Convert.ToInt32(Session["id_user"]);


        cislo_clanku = Convert.ToInt32(Session["id_clankupp"]);
        puv_clanek = DB.getClanekByIdnew(cislo_clanku);
        nadpis_clanku.Text = puv_clanek["nadpis_clanku"].ToString();
        obsah_aspektu.Text = puv_clanek["abstrakt"].ToString();

        conn = DB.getConnection();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (validator_nadpis.IsValid == true && validator_obsah.IsValid == true && validator_hodnoceni.IsValid == true)
        {

            string Nadpis = TextBox1.Text;

            string Abstrakt = TextBox2.Text;

            string Hodnoceni = TextBox3.Text;

            try
            {
                //values(@ID, @Autor, @Nadpis,@Obsah,@Hodnoceni)", getConnection());
                DB.insertKomentar(cislo_clanku, cislo_autora, Nadpis, Abstrakt, Hodnoceni);

                    Session["flashMsgType"] = "success";
                    Session["flashMsgText"] = "Názor byl úspěšně přidán";


                string message = "Byl vložen nový komentář ke článku s ID: '" + Convert.ToInt32(Session["id_clankupp"]) + "'";

                DataTable users = DB.getRedaktori();
                foreach (DataRow user in users.Rows)
                {
                    DB.insertNotification(int.Parse(user["id_user"].ToString()), message);
                }

            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Nastala chyba! Kontaktujte programátory. Text chyby: " + ex.Message;
                Response.Redirect(Request.RawUrl);
            }

            Response.Redirect("/ctenar/clanky");
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Všechna pole musí být vyplněna.";
            Response.Redirect(Request.RawUrl);
        }
    }
}