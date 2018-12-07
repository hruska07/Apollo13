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

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "autor"))
            Response.Redirect("/login");
        else
            cislo_autora = Convert.ToInt32(Session["id_user"]);

        conn = DB.getConnection();

    }

    protected string Saving_fi()
    {
        string file_path ="";
        if (!Directory.Exists(Server.MapPath("~/Saved_files/")))
        {
            Directory.CreateDirectory(Server.MapPath("~/Saved_files"));
        }

        if (FileUpload1.HasFile)
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Saved_files/") + FileUpload1.FileName);
            file_path = Server.MapPath("~/Saved_files/") + FileUpload1.FileName;
        }
        return file_path;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int soubor = 0;

        /*
                int cap = 0;

                 příprava pro kapacitu jednotlivých témat
                string strSelect = "Select Kapacita From Tema where Tema_pk = @temat";
                SqlCommand get_cap = new SqlCommand(strSelect, conn);
                get_cap.Parameters.AddWithValue("@temat", DropDownList1.SelectedValue.ToString());

                cap = Convert.ToInt32(get_cap.ToString());
                

        SqlCommand check_capacity = new SqlCommand("UPDATE [Tema] SET Kapacita = Kapacita - 1 WHERE Tema_pk = @temat");
            check_capacity.Parameters.AddWithValue("@temat", DropDownList1.SelectedValue.ToString());
            check_capacity.ExecuteNonQuery();
            */
        //textové pole nadpis
        string Nadpis = nadpis_clanku.Text;

            //textové pole obsahu

            string Abstrakt = obsah_aspektu.Text;
            //aktuální čas a datum
            DateTime date1 = DateTime.Now;

            //příkaz do databáze


            SqlCommand insert = new SqlCommand("insert into [Clanek] (nadpis_clanku, datum_clanku,autor,stav,tema,soubor,abstrakt,keywords,autors,workplace,path) values(@Nadpis, @datum_clanku,@autor,@stav,@tema,@soubor,@abstrakt,@keyw,@aut,@workpl,@patha)", conn);
            insert.Parameters.AddWithValue("@Nadpis", Nadpis);
            insert.Parameters.AddWithValue("@abstrakt", Abstrakt);
            insert.Parameters.AddWithValue("@datum_clanku", date1);
            insert.Parameters.AddWithValue("@autor", cislo_autora);
            insert.Parameters.AddWithValue("@stav", 1);
            insert.Parameters.AddWithValue("@tema", DropDownList1.SelectedValue.ToString());
            insert.Parameters.AddWithValue("@soubor", soubor);
            insert.Parameters.AddWithValue("@keyw", keywords.Text);
            insert.Parameters.AddWithValue("@aut", autors.Text);
            insert.Parameters.AddWithValue("@workpl", workplace.Text);
            insert.Parameters.AddWithValue("@patha", Saving_fi());



        try
            {
                //vložení do databáze
                insert.ExecuteNonQuery();

                Label7.Visible = true;
                Label7.ForeColor = System.Drawing.Color.Green;
                Label7.Text = "Příspěvek byl úspěšně přidán";
                
                Response.Redirect("/default");
            }
            catch (Exception ex)
            {
                Label7.Visible = true;
                Label7.ForeColor = System.Drawing.Color.Red;
                Label7.Text = "Error: " + ex.Message;
                
            }
        /*
        else
        {
            Label7.Visible = true;
            Label7.ForeColor = System.Drawing.Color.Red;
            Label7.Text = "Kapacita pro toto téma je již vyčerpána. Kontaktujte prosím správce.";
        }
        */


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        FileUpload1.FileContent.Dispose();
    }

}