using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class odeslani_stavu : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection conn = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    Database DB = new Database();
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB.getConnection();

    }

    protected void zdroj_odeslani_stavu_dropdown_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }


    protected void novy_zdroj_dat_form_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {
        
    }

    protected void FormView1_PageIndexChanging1(object sender, FormViewPageEventArgs e)
    {
       
    }
    protected void zmena(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
   

    }
}