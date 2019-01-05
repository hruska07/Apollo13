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
    int id_casopis;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB.getConnection();

        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "sefredaktor"))
            Response.Redirect("/login");

        if (Request.Params["casopis"] != null)
        {
            id_casopis = Convert.ToInt32(Request.Params["casopis"]);
            DataRow casopis = DB.getCasopisById(id_casopis);
            Label_oznaceni.Text = casopis["oznaceni"].ToString();
        }
        else
        {
            Response.Redirect("/sefredaktor/sprava-casopisu-otevrene");
        }

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id_clanek = Convert.ToInt32(e.CommandArgument);

        switch (e.CommandName)
        {
            case "ShowDetail":
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
                break;

            default:
                return;
        }
    }
}