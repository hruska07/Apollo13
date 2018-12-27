using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class sefredaktor_agenda_oponenti : System.Web.UI.Page
{
    Database DB = new Database();
    SqlCommand cmd;
    SqlConnection conn = null;
    SqlDataReader dr;
    string nejakapromena;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "sefredaktor"))
            Response.Redirect("/login");
        conn = DB.getConnection();


    }


    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridView2.SelectedValue != null)
        {
            Label4.Visible = true;
            Label5.Visible = true;
            Label2.Visible = true;
           
            TextBox2.Visible = true;
                    nejakapromena = GridView2.SelectedValue.ToString();
                        cmd = new SqlCommand("SELECT obsah_posudku FROM Posudek WHERE clanek=@id_clanek", conn);
                        cmd.Parameters.AddWithValue("@id_clanek", nejakapromena);
                        dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                TextBox2.Text = dr[0].ToString();
            }
            else
            {
                TextBox2.Text = "Žádný posudek";
            }
            
            dr.Close();
            cmd.Dispose();

       

        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        nejakapromena = GridView1.SelectedValue.ToString();
        
        Label3.Visible = true;
        cmd = new SqlCommand("SELECT Count ([Clanek].id_clanek) FROM [Propoj_clanek_oponent] JOIN [Clanek] ON [Propoj_clanek_oponent].clanek=[Clanek].id_clanek JOIN [User] ON [Clanek].autor=[User].id_user JOIN [Stav] ON [Clanek].stav=[Stav].id_stav WHERE ([Propoj_clanek_oponent].oponent=@oponent)", conn);
        cmd.Parameters.AddWithValue("@oponent", nejakapromena);
        dr = cmd.ExecuteReader();
       
        dr.Read();

        if (dr.HasRows)
        {
            Label4.Text = dr[0].ToString();
        }
        else
        {
            Label4.Text = "Žádný článek";
        }
        dr.Close();
        cmd.Dispose();

    }
}