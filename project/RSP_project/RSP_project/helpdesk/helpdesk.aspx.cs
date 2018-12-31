using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class helpdesk : System.Web.UI.Page
{

    Database DB = new Database();
    SqlCommand cmd;
    SqlConnection conn = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB.getConnection();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       bool prom = false;
        SqlCommand insert = new SqlCommand("insert into [Helpdesk] (obsah_helpdesk,jmeno,email,vyrizeno) values (@obsah_helpdesk,@jmeno,@email,@prom)", conn);
        insert.Parameters.AddWithValue("@obsah_helpdesk", TextBox3.Text);
        insert.Parameters.AddWithValue("@jmeno", TextBox1.Text);
        insert.Parameters.AddWithValue("@email", TextBox2.Text);
        insert.Parameters.AddWithValue("@prom", prom);
        insert.ExecuteNonQuery();
        Response.Redirect(Request.RawUrl);
    }
}