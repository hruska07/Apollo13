using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "sefredaktor"))
            Response.Redirect("/login");
    }

    protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName != "Sprava") return;
        int id = Convert.ToInt32(e.CommandArgument);
        Response.Redirect(String.Format("/sefredaktor/sprava-casopisu?casopis={0}", id));
    }
}