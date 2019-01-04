using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zpetna_vazba : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "ctenar"))
            Response.Redirect("/login");
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "ShowDetail":
                int id = Convert.ToInt32(e.CommandArgument);
                Session["id_clankupp"] = id;
                Response.Redirect(String.Format("/ctenar/pridat_komentar"));
                break;

            default:
                return;
        }
    }
}