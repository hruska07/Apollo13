﻿using System;
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
    Database DB = new Database();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id_user"] != null)
            Response.Redirect("/default");
        conn = DB.getConnection();
    }

    protected void Button_login_Click(object sender, EventArgs e)
    {
        string login = TextBox_login.Text;
        HashPw hp = new HashPw();
        string password = hp.HashString(TextBox_password.Text);
        cmd.CommandText = "SELECT * FROM [User] INNER JOIN [Role] ON [User].role = [Role].id_role WHERE login = @login AND password = @password";
        cmd.Parameters.AddWithValue("@login", login);
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(ds, "User");
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (password == ds.Tables[0].Rows[0]["password"].ToString())
            {

                //-- UKLADANI DO SESSION
                Session["id_user"] = ds.Tables[0].Rows[0]["id_user"].ToString();
                Session["nazev_role"] = ds.Tables[0].Rows[0]["nazev"].ToString();
                Session["id_role"] = ds.Tables[0].Rows[0]["role"].ToString();
                Session.Timeout = 5;
                //-- UKLADANI DO SESSION

                Response.Redirect("/default");
            }
            else
            {
                Label_output.Visible = true;
                Label_output.Text = "Špatné heslo!";
            }
        }
        else
        {
            Label_output.Visible = true;
            Label_output.Text = "Uživatel nenalezen!";
        }
    }
}