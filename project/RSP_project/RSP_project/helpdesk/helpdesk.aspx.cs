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
  //  SqlDataReader reader;
  
  
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
        insert.Dispose();
        string message2 = "Nový dotaz na Helpdesku !";

        cmd = new SqlCommand("SELECT id_user FROM [User] WHERE role=4 OR role=5 OR role=6  ", conn);
        SqlDataReader reader = cmd.ExecuteReader();
       int promena ;
      
        while (reader.Read())
        {
            promena = Convert.ToInt32(reader["id_user"]);


            DB.insertNotification(promena,message2);

        }
        //    DB.insertNotification(oponent, message2);
        reader.Close();
        cmd.Dispose();


        Response.Redirect(Request.RawUrl);
    }
}