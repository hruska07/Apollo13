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
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "autor"))
            Response.Redirect("/login");
        else
            cislo_autora = Convert.ToInt32(Session["id_user"]);

        if (Request.Params["clanek"] != null)
        {
            upravuje = true;
            cislo_clanku = int.Parse(Request.Params["clanek"]);
            puv_clanek = DB.getClanekById(cislo_clanku);
            if (puv_clanek["nazev_stav"].ToString() == "zamitnut" || puv_clanek["nazev_stav"].ToString() == "schvalen")
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Tento článek byl již schválen/zamítnut a nelze ho již upravovat!";
                Response.Redirect("/autor/moje-clanky");
            }
        }

        if (Request.Params["clanek"] != null && nadpis_clanku.Text == "")
        {
            nadpis_clanku.Text = puv_clanek["nadpis_clanku"].ToString();
            obsah_aspektu.Text = puv_clanek["abstrakt"].ToString();
            keywords.Text = puv_clanek["keywords"].ToString();
            autors.Text = puv_clanek["autors"].ToString();
            workplace.Text = puv_clanek["workplace"].ToString();
            DropDownList1.SelectedValue = puv_clanek["tema"].ToString();
        }

        conn = DB.getConnection();

        ZjistiKapacitu(1);
    }

    private void ZjistiKapacitu(int tema)
    {
        DataRow casopis = DB.getAktualniCasopisByTema(tema);
        Label_kapacita_kategorie.Text = String.Format("Počet článků ve vybraném čísle: <span class=\"my-text-red\">{0}/{1}</span><br>Datum uzávěrky vybraného čísla: <span class=\"my-text-red\">{2}</span>", casopis["pocet_clanku"], casopis["kapacita"], ((DateTime)casopis["datum_uzaverky"]).ToString("d. M. yyyy"));
        id_casopisu = (int)casopis["id_casopis"];
    }

    protected string Saving_fi()
    {
        string file_path = "";
        string folder = Server.MapPath("~/Saved_files/");
        if (!Directory.Exists(folder))
        {
            Directory.CreateDirectory(folder);
        }

        if (FileUpload1.HasFile)
        {
            file_path = FileUpload1.FileName;

            string nameToCheck = file_path;
            if (File.Exists(folder + nameToCheck))
            {
                int counter = 2;
                while (File.Exists(folder + nameToCheck))
                {
                    // if a file with this name already exists,
                    // prefix the filename with a number.
                    nameToCheck = counter.ToString() + file_path;
                    counter++;
                }
                file_path = nameToCheck;
            }
            FileUpload1.PostedFile.SaveAs(folder + file_path);
        }
        return file_path;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (validator_aspekt.IsValid == true && validator_nadpis.IsValid == true && validator_workplace.IsValid == true
            && validator_autors.IsValid == true && validator_keywords.IsValid == true)
        {
            int soubor = 0;
            //textové pole nadpis
            string Nadpis = nadpis_clanku.Text;

            //textové pole obsahu

            string Abstrakt = obsah_aspektu.Text;
            //aktuální čas a datum
            DateTime date1 = DateTime.Now;

            try
            {
                if (!upravuje)
                //příkaz do databáze
                {
                    DB.insertClanek(Nadpis, Abstrakt, date1, cislo_autora, id_casopisu, soubor, keywords.Text, autors.Text, workplace.Text, Saving_fi());

                    Session["flashMsgType"] = "success";
                    Session["flashMsgText"] = "Článek byl úspěšně přidán";
                }
                else
                {
                    string filename = FileUpload1.HasFile ? Saving_fi() : puv_clanek["path"].ToString();
                    DB.updateClanek(cislo_clanku, Nadpis, Abstrakt, date1, cislo_autora, id_casopisu, soubor, keywords.Text, autors.Text, workplace.Text, filename);

                    Session["flashMsgType"] = "success";
                    Session["flashMsgText"] = "Článek byl úspěšně upraven";
                    
                    // notifikace pro redaktora

                }
            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Nastala chyba! Kontaktujte programátory. Text chyby: " + ex.Message;
                Response.Redirect(Request.RawUrl);
            }

            Response.Redirect("/autor/moje-clanky");
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Všechna pole musí být vyplněna.";
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        FileUpload1.FileContent.Dispose();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ZjistiKapacitu(int.Parse(((DropDownList)sender).SelectedValue.ToString()));
    }
}