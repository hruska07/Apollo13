using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;

public partial class helpdesk_zobrazeni : System.Web.UI.Page
{


    Database DB = new Database();
    SqlCommand cmd;
    SqlConnection conn = null;
    SqlDataReader dr;
    Notifications email = new Notifications();
    string idecko,mail;
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
        idecko = GridView1.SelectedRow.Cells[1].Text;
        cmd = new SqlCommand("SELECT obsah_helpdesk,email FROM Helpdesk WHERE Id=@Id", conn);
        cmd.Parameters.AddWithValue("@Id", idecko);
        dr = cmd.ExecuteReader();
        dr.Read();


    
        TextBox1.Text = dr[0].ToString();
        mail=dr[1].ToString();

        dr.Close();
        cmd.Dispose();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool prom = true;

        SqlCommand update = new SqlCommand("update Helpdesk set odpoved=@odpoved,vyrizeno=@vyrizeno Where Id=@id", conn);
        update.Parameters.AddWithValue("@odpoved", TextBox2.Text);
        update.Parameters.AddWithValue("@vyrizeno", prom);
        update.Parameters.AddWithValue("@id", GridView1.SelectedValue);
        update.ExecuteNonQuery();


        email.sendEmail(mail, "Helpdesk - odpověď", TextBox2.Text);
  




        Response.Redirect(Request.RawUrl);


    }
}