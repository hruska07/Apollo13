﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;
using System.Data;

public partial class helpdesk : System.Web.UI.Page
{

    Database DB = new Database();
    SqlCommand insert;
   SqlConnection conn = null;
    List<int> termsList = new List<int>();
    DataRow uzivatele;
    Notifications nf = new Notifications();


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
       

                    try { 
        bool prome = false;
        SqlCommand insertis = new SqlCommand("insert into [Helpdesk] (obsah_helpdesk,jmeno,email,vyrizeno) values (@obsah_helpdesk,@jmeno,@email,@prom)", conn);
        insertis.Parameters.AddWithValue("@obsah_helpdesk", TextBox3.Text);
        insertis.Parameters.AddWithValue("@jmeno", TextBox1.Text);
        insertis.Parameters.AddWithValue("@email", TextBox2.Text);
        insertis.Parameters.AddWithValue("@prom", prome);
        insertis.ExecuteNonQuery();
        insertis.Dispose();

        //notifikace redaktoři a šéfredaktoři
        string message = "Nový dotaz na Helpdesku od "+TextBox1.Text+"";
        string message2 = "Nový dotaz na Helpdesku od " + TextBox1.Text + ".\n\nDotaz zní:\n\n" + TextBox3.Text;
        SqlCommand cmd = new SqlCommand("SELECT id_user FROM [User] WHERE role=4 OR role=5 OR role=6  ", conn);
      SqlDataReader readery = cmd.ExecuteReader();
        int promena;
        while (readery.Read())
        {
            promena = Convert.ToInt32(readery["id_user"]);
           termsList.Add(promena);
        }
        readery.Close();
        cmd.Dispose();
        int[] terms = termsList.ToArray();
        foreach (int element in terms)
        {
           DB.insertNotification(element, message);
           uzivatele = DB.getUserById(element);
       //     nf.sendEmail(uzivatele["email"].ToString(), "Helpdesk - nový dotaz", message2);


        }

        Session["flashMsgType"] = "success";
        Session["flashMsgText"] = "Dotaz byl úspěšně odeslán";
    }
        catch (Exception ex)
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Chyba při odesílání dat. Kontaktujte vývojáře.";
        }



Response.Redirect(Request.RawUrl);

    }
}