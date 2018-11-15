using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class redaktor_prideleni_oponenta : System.Web.UI.Page
{
    Database DB = new Database();
    SqlConnection conn = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "redaktor"))
            //Response.Redirect("login.aspx");

        conn = DB.getConnection();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand insert = new SqlCommand("insert into Propoj_clanek_oponent (clanek, oponent) values(@clanek, @oponent)", conn);
        insert.Parameters.AddWithValue("@clanek",GridView1.SelectedValue);
        insert.Parameters.AddWithValue("@oponent", DropDownList1.SelectedValue);

        SqlCommand get_ID_stav = new SqlCommand("SELECT [id_stav] FROM [Stav] WHERE [nazev_stav] = @nazev_stav", conn);
        get_ID_stav.Parameters.AddWithValue("@nazev_stav", "ma_oponenta");
        int id_stav = (int)get_ID_stav.ExecuteScalar();
        SqlCommand update = new SqlCommand("update Clanek set stav=@id_stav Where id_clanek=@clanek", conn);
        update.Parameters.AddWithValue("@id_stav", id_stav);
        update.Parameters.AddWithValue("@clanek", GridView1.SelectedValue);
     

        try
        {
            insert.ExecuteNonQuery();
            update.ExecuteNonQuery();
            Label1_vybrany_clanek.Text = "Record Inserted Succesfully into the Database";
            Label1_vybrany_clanek.ForeColor = System.Drawing.Color.CornflowerBlue;
        }
        catch (Exception ex)
        {
          Label1_vybrany_clanek.Text = "Error: " + ex.Message;
        }

        Response.Redirect("redaktor_prideleni_oponenta.aspx");
      

    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Label1_vybrany_clanek.Text = (GridView1.SelectedValue.ToString());
        Button1.Enabled = true;
    }
}