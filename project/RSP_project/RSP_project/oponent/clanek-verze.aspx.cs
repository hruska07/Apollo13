using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class oponent_stav : System.Web.UI.Page
{
    Database DB = new Database();
    Notifications nf = new Notifications();

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "oponent"))
            Response.Redirect("/login");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        switch (e.CommandName)
        {
            case "ShowDetail":
                Response.Redirect(String.Format("/clanky?c={0}", id));
                break;

            default:
                return;
        }
    }
}