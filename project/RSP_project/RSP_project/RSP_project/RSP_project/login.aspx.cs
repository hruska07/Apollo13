using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection conn = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Dominik\Downloads\Apollo13-master\Apollo13-master\project\RSP_project\RSP_project\App_Data\Apollo13.mdf;Integrated Security=True";
        conn.Open();
    }

    protected void Button_login_Click(object sender, EventArgs e)
    {
        String login = TextBox_login.Text;
      //  String pass = TextBox_password.Text;
        String hashresult = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox_password.Text, "SHA1");
        Label1_hash.Text = hashresult;


        cmd.CommandText = "SELECT * FROM Users WHERE login = '" + login + "' AND password = '" + hashresult + "'";
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(ds, "Users");
        if (ds.Tables[0].Rows.Count > 0) {
            if (hashresult == ds.Tables[0].Rows[0]["password"].ToString()) {
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