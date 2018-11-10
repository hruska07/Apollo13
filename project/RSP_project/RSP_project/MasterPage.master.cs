using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    Database DB = new Database();
    SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        DB.getConnection();

        if (Session["id_user"] == null)
        {
            Panel_not_logged.Visible = true;
            Panel_logged.Visible = false;
        }
        else
        {
            Panel_not_logged.Visible = false;
            Panel_logged.Visible = true;
            DataRow user = DB.getUserById(Convert.ToInt32(Session["id_user"]));
            Label_logged_user.Text = user["login"].ToString();
        }

    }
}
