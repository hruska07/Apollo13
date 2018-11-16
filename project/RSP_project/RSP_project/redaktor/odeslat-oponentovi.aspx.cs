using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class redaktor_odeslat_clanek : System.Web.UI.Page
{
    Database DB = new Database();
    SqlConnection conn = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "redaktor"))
            Response.Redirect("/login");

        conn = DB.getConnection();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
            Button_odeslat.Enabled = true;
    }

    protected void Button_odeslat_Click(object sender, EventArgs e)
    {
        SqlCommand update = new SqlCommand("update [Propoj_clanek_oponent] SET [datum_vyrizeni] = @datum WHERE [clanek] = @id_clanek", conn);
        update.Parameters.AddWithValue("@datum", textbox_datum.Text);
        update.Parameters.AddWithValue("@id_clanek", GridView1.SelectedValue);

        SqlCommand get_ID_stav = new SqlCommand("SELECT [id_stav] FROM [Stav] WHERE [nazev_stav] = @nazev_stav", conn);
        get_ID_stav.Parameters.AddWithValue("@nazev_stav", "ceka_na_posudek");
        int id_stav = (int)get_ID_stav.ExecuteScalar();
        SqlCommand update2 = new SqlCommand("update Clanek set stav=@id_stav Where id_clanek=@clanek", conn);
        update2.Parameters.AddWithValue("@id_stav", id_stav);
        update2.Parameters.AddWithValue("@clanek", GridView1.SelectedValue);


        try
        {
            update.ExecuteNonQuery();
            update2.ExecuteNonQuery();
            Label_message.Visible = true;
            Label_message.Text = "Record Inserted Succesfully into the Database";
            Label_message.ForeColor = System.Drawing.Color.CornflowerBlue;
        }
        catch (Exception ex)
        {
            Label_message.Visible = true;
            Label_message.Text = "Error: " + ex.Message;
        }

        Response.Redirect("/redaktor/odeslat-oponentovi");
    }
}