using System;

public partial class Agenda_Redakor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "sefredaktor"))
            Response.Redirect("/login");
    }
}