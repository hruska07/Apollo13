using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class login : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection conn = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Knihovna\Projekty_rsp\Apollo13\project\RSP_project\RSP_project\App_Data\Apollo13.mdf;Integrated Security=True";
        conn.Open();
    }

    protected void Button_login_Click(object sender, EventArgs e)
    {
        String login = TextBox_login.Text;
        String pass = TextBox_password.Text;

        cmd.CommandText = "SELECT * FROM Users WHERE login = '" + login + "' AND password = '" + pass + "'";
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(ds, "Users");
        if (ds.Tables[0].Rows.Count > 0) {
            if (pass == ds.Tables[0].Rows[0]["password"].ToString()) {
                Session["role"] = ds.Tables[0].Rows[0]["typ_user"].ToString();
                Label_output.Text = "Úspěšně přihlášen!\nRole: " + Session["role"];
            }
            else {
                Label_output.Text = "Špatné heslo!";
            }
        }
        else {
            Label_output.Text = "Uživatel nenalezen!";
        }
    }
}