using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

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
         //if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "autor"))
              //Response.Redirect("login.aspx");
         //else
              cislo_autora = Convert.ToInt32(Session["id_user"]);

        conn = DB.getConnection();

        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //textové pole nadpis
        string Nadpis = nadpis_clanku.Text;

        //textové pole obsahu
        string Obsah = obsah_clanku.Text;

        //aktuální čas a datum
        DateTime date1 = DateTime.Now;

        //příkaz do databáze
        SqlCommand insert = new SqlCommand("insert into [Clanek] (nadpis_clanku,obsah_clanku, datum_clanku,autor,stav) values(@Nadpis,@Obsah, @datum_clanku,@autor,@stav)", conn);
        insert.Parameters.AddWithValue("@Nadpis", Nadpis);
        insert.Parameters.AddWithValue("@Obsah", Obsah);
        insert.Parameters.AddWithValue("@datum_clanku", date1);
        insert.Parameters.AddWithValue("@autor", cislo_autora);
        insert.Parameters.AddWithValue("@stav", 1);

        try
        {
            //vložení do databáze
            insert.ExecuteNonQuery();

            Label3.Visible = true;
            Label3.ForeColor = System.Drawing.Color.Green;
            Label3.Text = "Příspěvek byl úspěšně přidán";
            //Response.Redirect("Default.aspx");
        }
        catch (Exception ex)
        {
            Label3.Visible = true;
            Label3.ForeColor = System.Drawing.Color.Red;
            Label3.Text = "Error: " + ex.Message;
            //Response.Redirect("Default.aspx");
        }
    }
}