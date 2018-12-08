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
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "autor"))
            Response.Redirect("/login");
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "ShowDetail") return;
        int id = Convert.ToInt32(e.CommandArgument);
        Response.Redirect(String.Format("/clanky?c={0}", id));
    }
}