﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class redaktor_zpristupneni_posudku : System.Web.UI.Page
{
    Database DB = new Database();
    SqlCommand cmd;
    SqlConnection conn = null;
    SqlDataReader dr;
    string idecko,pomocna,komentar;
    bool zpristupnen;


    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "redaktor"))
            Response.Redirect("/login");

        conn = DB.getConnection();
        if (!Page.IsPostBack)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            CheckBox1.Visible = false;
            Button1.Visible = false;
            TextBox1.Visible = false;
        }

    }

    protected void GridView14_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {

    }

    protected void GridView13_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label3.Visible = true;
        Label4.Visible = true;
        CheckBox1.Visible = true;
        Button1.Visible = true; 


      
            idecko = GridView13.SelectedRow.Cells[1].Text;
            cmd = new SqlCommand("SELECT zpristupnen,komentar FROM Posudek WHERE id_posudek=@id_posude", conn);
            cmd.Parameters.AddWithValue("@id_posude", idecko);
            dr = cmd.ExecuteReader();
            dr.Read();
            
            CheckBox1.Checked = Convert.ToBoolean(dr[0]);
            TextBox1.Text = dr[1].ToString();
           
            dr.Close();
            cmd.Dispose();
        
            TextBox1.Visible = true;

          

        
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

      
        zpristupnen = CheckBox1.Checked;
        komentar = TextBox1.Text;

          SqlCommand update = new SqlCommand("update Posudek set zpristupnen=@zpristupnen,komentar=@komentar Where id_posudek=@id_posudek", conn);
        update.Parameters.AddWithValue("@zpristupnen", zpristupnen);
        update.Parameters.AddWithValue("@komentar", komentar);
        update.Parameters.AddWithValue("@id_posudek", GridView13.SelectedValue);
        update.ExecuteNonQuery();
        Response.Redirect(Request.RawUrl);
       

    }

    protected void GridView11_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Visible = true;
    }

    protected void GridView12_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Visible = true;
    }
}