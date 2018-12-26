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
        conn = DB.getConnection();


    }


    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridView2.SelectedValue != null)
        {
            
            Label2.Visible = true;
           
            TextBox2.Visible = true;
                    nejakapromena = GridView2.SelectedRow.Cells[1].Text;
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
        Label3.Visible = true;
    }
}