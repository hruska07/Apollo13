﻿using System;
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
        rbl_role.SelectedIndex = 2;
    }

    protected void Button_register_Click(object sender, EventArgs e)
    {
        if (validator_email.IsValid == true && validator_heslo.IsValid == true && validator_jmeno.IsValid == true
            && validator_login.IsValid == true && validator_prijmeni.IsValid == true && CompareValidator_stejnaPW.IsValid == true)
        {
            //nacteni dat do promennych
            string login = TextBox_login.Text;
            string jmeno = TextBox_jmeno.Text;
            string prijmeni = TextBox_prijmeni.Text;
            string email = TextBox_email.Text;
#pragma warning disable CS0618 // Typ nebo člen je zastaralý.
            string pass1 = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox_password1.Text, "SHA256");
            string pass2 = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox_password2.Text, "SHA256");
#pragma warning restore CS0618 // Typ nebo člen je zastaralý
            string role = "7";
            if (rbl_role.SelectedIndex == 0)
                role = "4";
            if (rbl_role.SelectedIndex == 1)
                role = "5";

            //vytvoreni pripojeni do db
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Apollo13.mdf;Integrated Security=True");
            conn.Open();
            //KONTROLA TOHO ZDA LOGIN NEBO EMAIL NENI V UZ VYTVOREN
            SqlCommand check_Login = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE ([login] = @login)", conn);
            SqlCommand check_Email = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE ([email] = @email)", conn);
            check_Login.Parameters.AddWithValue("@login", login);
            check_Email.Parameters.AddWithValue("@email", email);
            int LoginExist = (int)check_Login.ExecuteScalar();
            int EmailExist = (int)check_Email.ExecuteScalar();
            if (LoginExist > 0 || EmailExist > 0)
            {
                Label_output.Text=Label_output2.Text = "";
                if (LoginExist > 0)
                    Label_output.Text += "Vybraný login je již zabrán ";
                if (EmailExist > 0)
                    Label_output2.Text += "Email je již zaregistrován";
            }
            else
            {
                //vytvoreni connectu
                SqlCommand insert = new SqlCommand("insert into [User] (jmeno, prijmeni,login, password,role,email) values(@jmeno, @prijmeni,@login, @password,@role,@email)", conn);
                insert.Parameters.AddWithValue("@jmeno", jmeno);
                insert.Parameters.AddWithValue("@prijmeni", prijmeni);
                insert.Parameters.AddWithValue("@login", login);
                insert.Parameters.AddWithValue("@password", pass1);
                insert.Parameters.AddWithValue("@role", role);
                insert.Parameters.AddWithValue("@email", email);
                try
                {
                    insert.ExecuteNonQuery();
                    Label_output.Text = "Účet úspěšně vytvořen s rolí: " + rbl_role.SelectedItem.Value;
                    Label_output.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                catch (Exception ex)
                {
                    Label_output.Text = "Error: " + ex.Message;
                }
            }
            conn.Close();
        }
    }
}
