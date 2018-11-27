using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection conn = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    Database DB = new Database();

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB.getConnection();

        if (Request.RawUrl.ToString().Contains("/clanky?c=") && Request.RawUrl.ToString() != "/clanky?c=")
        {
            string a = Request.RawUrl.ToString();
            Panel_prehled.Visible = false;
            Panel_detail.Visible = true;
            int id_clanek = Convert.ToInt32(Request.RawUrl.ToString().Substring(10));
            DataRow clanek = DB.getClanekById(id_clanek);
            Label_nadpis.Text = clanek["nadpis_clanku"].ToString();
            Label_datum.Text = clanek["datum_clanku"].ToString();
            Label_abstrakt.Text = clanek["abstrakt"].ToString();
            Label_autor.Text = clanek["cele_jmeno"].ToString();
        }
        else
        {
            Panel_prehled.Visible = true;
            Panel_detail.Visible = false;
        }

    }

    

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("/clanky?c=" + GridView1.SelectedValue);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_clanek = Convert.ToInt32(Request.RawUrl.ToString().Substring(10));
        DataRow clanek = DB.getClanekById(id_clanek);
        int id = 0;
        try
        {
             id = Convert.ToInt32(clanek["soubor"].ToString());
        }
        catch (Exception)
        {
            Button1.Enabled = false;
        }

        if (Button1.Enabled == true && id!= 0)
        {
            DataTable dt = new DataTable();

             cmd = new SqlCommand("GetDocument", conn);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
             SqlDataReader reader = cmd.ExecuteReader();

             dt.Load(reader);


            string name = dt.Rows[0]["Name"].ToString();
            byte[] documentBytes = (byte[])dt.Rows[0]["DocumentContent"];

            Response.ClearContent();
            Response.ContentType = "Application/octetstream";
            Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}", name));
            Response.AddHeader("Content-Lenght", documentBytes.Length.ToString());

            Response.BinaryWrite(documentBytes);
            Response.Flush();
            Response.Close();
        }
        


    }
}