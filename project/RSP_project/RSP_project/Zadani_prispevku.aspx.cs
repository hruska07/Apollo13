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
    int cislo_autora = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        // if ((Session["role"]==null) &&(Session["role"].ToString()!="3"))
        //      Response.Redirect("login.aspx");
        // else
        //      cislo_autora = Convert.ToInt32(Session["role"]);

        conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Apollo13.mdf;Integrated Security=True";
        conn.Open();
        
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
        SqlCommand insert = new SqlCommand("insert into [Clanek] (nadpis_clanku,obsah_clanku, datum_clanku,autor,ma_oponenta) values(@Nadpis,@Obsah, @datum_clanku,@autor,@ma_oponenta)", conn);
        insert.Parameters.AddWithValue("@Nadpis", Nadpis);
        insert.Parameters.AddWithValue("@Obsah", Obsah);
        insert.Parameters.AddWithValue("@datum_clanku", date1);
        //Nutno dodělat ze Session
        insert.Parameters.AddWithValue("@autor", cislo_autora);
        insert.Parameters.AddWithValue("@ma_oponenta", false);

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

        conn.Close();
}

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
}