using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class redaktor_zpristupneni_posudku : System.Web.UI.Page
{
    Database DB = new Database();
    SqlCommand cmd;
    SqlConnection conn = null;
    SqlDataReader dr;
    Notifications nf = new Notifications();
    string idecko,pomocna,komentar;
    bool zpristupnen;


    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["id_user"] == null) || (Session["nazev_role"].ToString() != "redaktor"))
            Response.Redirect("/login");

        conn = DB.getConnection();
        if (!Page.IsPostBack)
        {
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            CheckBox1.Visible = false;
            Button1.Visible = false;
            TextBox1.Visible = false;
        }

    }

    protected void GridView14_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {

    }

    protected void GridView13_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label3.Visible = true;
        Label4.Visible = true;
        CheckBox1.Visible = true;
        Button1.Visible = true;
        Label6.Visible = true;
        Label7.Visible = true;


       
        idecko = GridView13.SelectedValue.ToString();
        cmd = new SqlCommand("SELECT zpristupnen,doplnujici_komentar,namety_k_diskuzi FROM Posudek WHERE id_posudek=@id_posude", conn);
            cmd.Parameters.AddWithValue("@id_posude", idecko);
            dr = cmd.ExecuteReader();
            dr.Read();
            
            CheckBox1.Checked = Convert.ToBoolean(dr[0]);
            TextBox1.Text = dr[1].ToString();
        TextBox2.Text = dr[2].ToString();


        dr.Close();
        cmd.Dispose();
        cmd = new SqlCommand("SELECT [Souhrnne_vyjadreni].id_vyjadreni FROM [Posudek] JOIN [Souhrnne_vyjadreni] ON [Posudek].souhrnne_vyjadreni=[Souhrnne_vyjadreni].id_vyjadreni WHERE id_posudek=@id_posude", conn);
        cmd.Parameters.AddWithValue("@id_posude", idecko);
        dr = cmd.ExecuteReader();
        dr.Read();

        DropDownList_souhrnne_vyjadreni.SelectedValue = dr[0].ToString();
      


        dr.Close();
        cmd.Dispose();




        TextBox1.Visible = true;
        TextBox2.Visible = true;
        DropDownList_souhrnne_vyjadreni.Visible = true;

     



    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //notifikace - oponent


        DataRow posudek = DB.getPosudekById(Convert.ToInt32(GridView13.SelectedValue.ToString()));
        DataRow uzivatel = DB.getUserById(Convert.ToInt32(posudek["oponent"].ToString()));
        string message2 = "Redaktor zkontroloval váš posudek!";
        nf.sendEmail(uzivatel["email"].ToString(), "Zkontrolovaný posudek", message2);
        //notifikace - stranky - oponent
        DB.insertNotification(int.Parse(posudek["oponent"].ToString()), message2);



        zpristupnen = CheckBox1.Checked;
        if (zpristupnen)
        {
            //notifikace - autor
           
            //notifikace - mail - autor
            DataRow clanek = DB.getClanekById(Convert.ToInt32(GridView12.SelectedValue.ToString()));
            DataRow user = DB.getUserById(Convert.ToInt32(clanek["autor"].ToString()));
            string message = "Váš článek: '" + clanek["nadpis_clanku"] + " má nové hodnocení !";
            nf.sendEmail(user["email"].ToString(), "Zpřístupněný posudek", message);
            //notifikace - stranky - autor
            DB.insertNotification(int.Parse(clanek["autor"].ToString()), message);




        }

        komentar = TextBox1.Text;

          SqlCommand update = new SqlCommand("update Posudek set zpristupnen=@zpristupnen,doplnujici_komentar=@doplnujici_komentar, namety_k_diskuzi=@namet, souhrnne_vyjadreni = @vyjadreni Where id_posudek=@id_posudek", conn);
        update.Parameters.AddWithValue("@zpristupnen", zpristupnen);
        update.Parameters.AddWithValue("@doplnujici_komentar", komentar);
        update.Parameters.AddWithValue("@id_posudek", GridView13.SelectedValue);
        update.Parameters.AddWithValue("@namet", TextBox2.Text);
        update.Parameters.AddWithValue("@vyjadreni", DropDownList_souhrnne_vyjadreni.SelectedValue);
        update.ExecuteNonQuery();

        Response.Redirect(Request.RawUrl);
       

    }

    protected void GridView11_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Visible = true;
    }

    protected void GridView12_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id_clanek;

        switch (e.CommandName)
        {
            case "Schvalit":
                id_clanek = Convert.ToInt32(e.CommandArgument);
                try
                {
                    DB.aktualizovatStavClanku(id_clanek, "schvalen");
                    Session["flashMsgType"] = "success";
                    Session["flashMsgText"] = "Článek byl úspěšně schválen.";

                    //notifikace - autor
                    //notifikace - mail - autor
                    DataRow clanek = DB.getClanekById(Convert.ToInt32(GridView12.SelectedValue.ToString()));
                    DataRow user = DB.getUserById(Convert.ToInt32(clanek["autor"].ToString()));
                    string message = "Váš článek: '" + clanek["nadpis_clanku"] + "' byl SCHVÁLEN!";
                    nf.sendEmail(user["email"].ToString(), "Schválený článek", message);
                    //notifikace - stranky - autor
                    DB.insertNotification(int.Parse(clanek["autor"].ToString()), message);

                }
                catch (Exception ex)
                {
                    Session["flashMsgType"] = "danger";
                    Session["flashMsgText"] = "Nastala chyba! Kontaktujte programátory. Text chyby: " + ex.Message;
                    Response.Redirect(Request.RawUrl);
                }
                Response.Redirect(Request.RawUrl);
                break;

            case "Zamitnout":
                id_clanek = Convert.ToInt32(e.CommandArgument);
                try
                {
                    DB.aktualizovatStavClanku(id_clanek, "zamitnut");
                    Session["flashMsgType"] = "success";
                    Session["flashMsgText"] = "Článek byl úspěšně zamítnut.";

                    //notifikace - autor
                    //notifikace - mail - autor
                    DataRow clanek = DB.getClanekById(Convert.ToInt32(id_clanek.ToString()));
                    DataRow user = DB.getUserById(Convert.ToInt32(clanek["autor"].ToString()));
                    string message = "Váš článek: '" + clanek["nadpis_clanku"] + "' byl ZAMÍTNUT !";
                    nf.sendEmail(user["email"].ToString(), "Zamítnutý článek", message);
                    //notifikace - stranky - autor
                    DB.insertNotification(int.Parse(clanek["autor"].ToString()), message);

                }
                catch (Exception ex)
                {
                    Session["flashMsgType"] = "danger";
                    Session["flashMsgText"] = "Nastala chyba! Kontaktujte programátory. Text chyby: " + ex.Message;
                    Response.Redirect(Request.RawUrl);
                }
                Response.Redirect(Request.RawUrl);
                break;

            case "Select":
                Label2.Visible = true;
                break;

            case "Version":
                id_clanek = Convert.ToInt32(e.CommandArgument);
                Response.Redirect(String.Format("/redaktor/clanek-verze?clanek={0}", id_clanek));
                break;

            case "ShowDetail":
                id_clanek = Convert.ToInt32(e.CommandArgument);
                Response.Redirect(String.Format("/clanky?c={0}", id_clanek));
                break;

            default:
                return;
        }
    }
}