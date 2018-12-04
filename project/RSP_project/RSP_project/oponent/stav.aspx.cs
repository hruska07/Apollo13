using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class oponent_stav : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {
       
    }

    protected void zmena(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);


    }
}