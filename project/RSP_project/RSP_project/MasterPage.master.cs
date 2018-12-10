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
        Page.MaintainScrollPositionOnPostBack = true;

        Notifications.Visible = false;

        DB.getConnection();

        if (Session["id_user"] == null)
        {
            Panel_not_logged.Visible = true;
            Panel_logged.Visible = false;
            Panel_role_menu.Visible = false;
        }
        else
        {
            DataTable notifications = DB.getNotifications(int.Parse(Session["id_user"].ToString()));
            if (notifications.Rows.Count > 0)
            {
                Notifications.Visible = true;

                string html = "<h4 class=\"alert-heading\">Nové upozornění!</h4>";
                foreach (DataRow notification in notifications.Rows)
                {
                    html += "<hr class=\"mt-1\"><p class=\"mb-0\">" + notification["zprava"] + "</p>";
                }
                html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                    "<span aria-hidden=\"true\">&times;</span>" +
                    "</button>";

                Notifications.InnerHtml = html;
            }

            Panel_not_logged.Visible = false;
            Panel_logged.Visible = true;
            DataRow user = DB.getUserById(Convert.ToInt32(Session["id_user"]));
            Label_logged_user.Text = user["login"].ToString() + " (" + user["nazev"] + ")";
            Panel_role_menu.Visible = true;
            switch (user["nazev"].ToString())
            {
                case "autor":
                    Label_role_menu.Text = "AUTOR";
                    Panel_autor.Visible = true;
                    break;

                case "redaktor":
                    Label_role_menu.Text = "REDAKTOR";
                    Panel_redaktor.Visible = true;
                    break;

                case "oponent":
                    Label_role_menu.Text = "OPONENT";
                    Panel_oponent.Visible = true;
                    break;

                case "sefredaktor":
                    Label_role_menu.Text = "ŠÉFREDAKTOR";
                    Panel_sefredaktor.Visible = true;
                    break;
            }
        }

    }
}
