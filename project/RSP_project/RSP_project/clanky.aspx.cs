using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection conn = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    Database DB = new Database();

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB.getConnection();

        if (Request.RawUrl.ToString().Contains("/clanky?c=") && Request.RawUrl.ToString() != "/clanky?c=")
        {
            string a = Request.RawUrl.ToString();
            Panel_prehled.Visible = false;
            Panel_detail.Visible = true;
            int id_clanek = Convert.ToInt32(Request.RawUrl.ToString().Substring(10));
            DataRow clanek = DB.getClanekById(id_clanek);
            Label_nadpis.Text = clanek["nadpis_clanku"].ToString();
            Label_datum.Text = clanek["datum_clanku"].ToString();
            Label_keywords.Text = clanek["keywords"].ToString();
            Label_abstrakt.Text = clanek["abstrakt"].ToString();
            Label_autor.Text = clanek["autors"].ToString();
            Label_pracoviste.Text = clanek["workplace"].ToString();
        }
        else
        {
            Panel_prehled.Visible = true;
            Panel_detail.Visible = false;
        }

    }

    

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("/clanky?c=" + GridView1.SelectedValue);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_clanek = Convert.ToInt32(Request.RawUrl.ToString().Substring(10));
        DataRow clanek = DB.getClanekById(id_clanek);
        string path = clanek["path"].ToString();
        string name = clanek["nadpis_clanku"].ToString();

        if (path != "")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("content-disposition", "filename=" + path);
            Response.TransmitFile(Server.MapPath("~/Saved_files/") + path);
            Response.End();
        }

    }
}