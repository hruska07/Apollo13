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
     
            TextBox1.Visible = true;
/*            nejakapromena = GridView2.SelectedRow.Cells[1].Text;
            cmd = new SqlCommand("SELECT zpristupnen,komentar FROM Posudek WHERE id_posudek=@id_posude", conn);
            cmd.Parameters.AddWithValue("@id_posude", nejakapromena);
            dr = cmd.ExecuteReader();
            dr.Read();*/




        }
    }
}