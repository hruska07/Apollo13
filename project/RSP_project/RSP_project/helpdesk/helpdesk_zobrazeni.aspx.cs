using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;
using System.Data;

public partial class helpdesk_zobrazeni : System.Web.UI.Page
{


    Database DB = new Database();
    SqlCommand cmd;
    SqlConnection conn = null;
    SqlDataReader dr;
    Notifications ema = new Notifications();
    string idecko,mailik;



    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || ((Session["nazev_role"].ToString() != "redaktor") && (Session["nazev_role"].ToString() != "sefredaktor") && (Session["nazev_role"].ToString() != "admin")))
            Response.Redirect("/default");

        conn = DB.getConnection();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Visible = true;
        Label2.Visible = true;
        Button1.Visible = true;
        TextBox1.Visible = true;
        TextBox2.Visible = true;
        idecko = GridView1.SelectedValue.ToString();
        cmd = new SqlCommand("SELECT obsah_helpdesk,email FROM Helpdesk WHERE Id=@Id", conn);
        cmd.Parameters.AddWithValue("@Id", idecko);
        dr = cmd.ExecuteReader();
        dr.Read();



        TextBox1.Text = dr[0].ToString();
  
        mailik =dr[1].ToString();
        
        dr.Close();
        cmd.Dispose();
      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        try { 
        idecko = GridView1.SelectedValue.ToString();
        cmd = new SqlCommand("SELECT email FROM Helpdesk WHERE Id=@Id", conn);
        cmd.Parameters.AddWithValue("@Id", idecko);
        dr = cmd.ExecuteReader();
        dr.Read();



        

        mailik = dr[0].ToString();

        dr.Close();
        cmd.Dispose();


        bool prom = true;

        SqlCommand update = new SqlCommand("update Helpdesk set odpoved=@odpoved,vyrizeno=@vyrizeno Where Id=@id", conn);
        update.Parameters.AddWithValue("@odpoved", TextBox2.Text);
        update.Parameters.AddWithValue("@vyrizeno", prom);
        update.Parameters.AddWithValue("@id", GridView1.SelectedValue);
        update.ExecuteNonQuery();
        update.Dispose();
      
      ema.sendEmail(mailik.ToString(), "Helpdesk - odpověď", TextBox2.Text.ToString());

        Session["flashMsgType"] = "success";
        Session["flashMsgText"] = "Odpověď byla úspěšně odeslána";
    }
        catch (Exception ex)
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Chyba při odesílání odpovědi. Kontaktujte vývojáře.";
        }



Response.Redirect(Request.RawUrl);


    }
}