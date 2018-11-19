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

    protected int Ulozit_soubor()
    {
        FileInfo fi = new FileInfo(FileUpload1.FileName);
        byte[] documentContent = FileUpload1.FileBytes;

        string name = fi.Name;
        string extn = fi.Extension;

        SqlCommand cmd = new SqlCommand("SaveDocument", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = name;
        cmd.Parameters.Add("@Content", SqlDbType.VarBinary).Value = documentContent;
        cmd.Parameters.Add("@Extn", SqlDbType.VarChar).Value = extn;

        cmd.ExecuteNonQuery();

        SqlCommand get_ID = new SqlCommand("SELECT ID FROM [Documents] WHERE Name=@Name && Content=&Content && Extn=@Extn", conn);
        int id = Convert.ToInt32(get_ID.ToString());

        return id;
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        int soubor = 0;
        //textové pole nadpis
        string Nadpis = nadpis_clanku.Text;

        //textové pole obsahu
        string Obsah = obsah_clanku.Text;

        string Abstrakt = obsah_aspektu.Text;
        //aktuální čas a datum
        DateTime date1 = DateTime.Now;

        //příkaz do databáze
        if (CheckBox1.Checked == true)
        {
            soubor = Ulozit_soubor();
        }
        else
        {
            soubor = 0; 
        }

        SqlCommand insert = new SqlCommand("insert into [Clanek] (nadpis_clanku,obsah_clanku, datum_clanku,autor,stav,tema,soubor,abstrakt) values(@Nadpis,@Obsah, @datum_clanku,@autor,@stav,@tema,@soubor,@abstrakt)", conn);
        insert.Parameters.AddWithValue("@Nadpis", Nadpis);
        insert.Parameters.AddWithValue("@Obsah", Obsah);
        insert.Parameters.AddWithValue("@abstrakt", Abstrakt);
        insert.Parameters.AddWithValue("@datum_clanku", date1);
        insert.Parameters.AddWithValue("@autor", cislo_autora);
        insert.Parameters.AddWithValue("@stav", 1);
        insert.Parameters.AddWithValue("@tema", DropDownList1.SelectedIndex.ToString());
        insert.Parameters.AddWithValue("@soubor", soubor);

        try
        {
            //vložení do databáze
            insert.ExecuteNonQuery();

            Label7.Visible = true;
            Label7.ForeColor = System.Drawing.Color.Green;
            Label7.Text = "Příspěvek byl úspěšně přidán";
            //Response.Redirect("/default");
        }
        catch (Exception ex)
        {
            Label7.Visible = true;
            Label7.ForeColor = System.Drawing.Color.Red;
            Label7.Text = "Error: " + ex.Message;
            //Response.Redirect("/default");
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        FileUpload1.FileContent.Dispose();
    }


}