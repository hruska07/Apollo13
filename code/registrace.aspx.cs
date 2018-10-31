using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class registrace : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_login_Click(object sender, EventArgs e)
    {           
        //nacteni dat do promennych
        string login = TextBox_login.Text;
        string jmeno= TextBox_jmeno.Text;
        string prijmeni= TextBox_prijmeni.Text;
        string email= TextBox_email.Text;
#pragma warning disable CS0618 // Typ nebo člen je zastaralý.
        string pass1 = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox_password1.Text, "SHA1");
        string pass2 = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox_password2.Text, "SHA1");
#pragma warning restore CS0618 // Typ nebo člen je zastaralý.

        //vytvoreni connectu
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Apollo13.mdf;Integrated Security=True");
        SqlCommand insert = new SqlCommand("insert into users(jmeno, prijmeni,login, password,email) values(@jmeno, @prijmeni,@login, @password,@email)", conn);
        insert.Parameters.AddWithValue("@jmeno", jmeno);
        insert.Parameters.AddWithValue("@prijmeni", prijmeni);
        insert.Parameters.AddWithValue("@login", login);
        insert.Parameters.AddWithValue("@password", pass1);
        insert.Parameters.AddWithValue("@email", email);
        try
        {
            conn.Open();
            insert.ExecuteNonQuery();
            Label_output.Text = "Record Inserted Succesfully into the Database";
            Label_output.ForeColor = System.Drawing.Color.CornflowerBlue;
        }
        catch (Exception ex)
        {
            Label_output.Text = "Error: " + ex.Message;
        }
        finally
        {
            conn.Close();
        }

    }
}

/*
{
    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\DB_Users.mdf;Integrated Security=True");
SqlCommand insert = new SqlCommand("insert into tbl_users(name, username, password,email) values(@name, @username, @password,@email)", conn);
insert.Parameters.AddWithValue("@name", txtname.Text);
    insert.Parameters.AddWithValue("@username", txtusername.Text);
    insert.Parameters.AddWithValue("@password", txtpassword.Text);
    insert.Parameters.AddWithValue("@email", txtemail.Text);
    try
    {
        conn.Open();
        insert.ExecuteNonQuery();
        lbl_msg.Text = "Register done !";
      //lbl_msg.Text = "ثبت نام با موفقیت انجام شد";
    }
    catch (Exception ex)
    {
        lbl_msg.Text = "Error: "+ex.Message;
      //lbl_msg.Text = "خطا در ارتباط با پایگاه داده";
        conn.Close();
    }
}*/