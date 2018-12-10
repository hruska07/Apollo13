using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class redaktor_terminy_oponenti : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "redaktor"))
            Response.Redirect("/login");
    }

    protected void zdroj_oponenti_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {


    }
}