using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zpetna_vazba : System.Web.UI.Page
{
    Database DB = new Database();
    SqlCommand cmd;
    SqlConnection conn = null;
    SqlDataReader dr;
    Notifications nf = new Notifications();
    string idecko, pomocna, komentar;
    bool zpristupnen;

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "autor"))
            Response.Redirect("/login");

        conn = DB.getConnection();
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "ShowDetail":
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect(String.Format("/clanky?c={0}", id));
                break;

            case "EditArticle":
                int id2 = Convert.ToInt32(e.CommandArgument);
                Response.Redirect(String.Format("/autor/pridat-clanek?clanek={0}", id2));
                break;


            case "Select":
                Label4.Visible = false;
                Label6.Visible = false;
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                break;
            default:
                return;
        }
    }

    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
        {
            return;
        }

        Button button = (Button)e.Row.FindControl("upravit_button");

        string nazev_stav = (string)((DataRowView)e.Row.DataItem)["nazev_stav"];

        if (nazev_stav == "zamitnut" || nazev_stav == "schvalen")
        {
            button.Enabled = false;
            button.ToolTip = "Tento článek byl již schválen/zamítnut a nelze ho již upravovat!";
        }
        else
        {
            button.Enabled = true;
        }
    }

    protected void GridView13_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label4.Visible = true;
        Label6.Visible = true;
        TextBox1.Visible = true;
        TextBox2.Visible = true;
        idecko = GridView13.SelectedValue.ToString();
        cmd = new SqlCommand("SELECT zpristupnen,doplnujici_komentar,namety_k_diskuzi FROM Posudek WHERE id_posudek=@id_posude", conn);
        cmd.Parameters.AddWithValue("@id_posude", idecko);
        dr = cmd.ExecuteReader();
        dr.Read();
        TextBox1.Text = dr[1].ToString();
        TextBox2.Text = dr[2].ToString();
        dr.Close();
        cmd.Dispose();
        
        TextBox1.Enabled = false;
        TextBox2.Enabled = false;
        
    }
}