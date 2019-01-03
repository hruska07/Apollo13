using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

public partial class _Default : System.Web.UI.Page
{
    Database DB = new Database();
    Notifications nf = new Notifications();
    int id_user;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id_user"] == null)
            Response.Redirect("/default");
        else {
            id_user = int.Parse(Session["id_user"].ToString());
            DataRow user = DB.getUserById(id_user);

            Label_login.Text = user["login"].ToString();
            Label_email.Text = user["email"].ToString();
            Label_jmeno.Text = user["jmeno"].ToString();
            Label_prijmeni.Text = user["prijmeni"].ToString();
            //Label_heslo.Text = user["password"].ToString();

            /*Session["flashMsgType"] = "success";
            Session["flashMsgText"] = "Hodnocení bylo úspěšně odesláno";*/
        }
    }

    protected void Button_zmenit_login_Click(object sender, EventArgs e)
    {
        Label_login.Visible = false;
        Button_zmenit_login.Visible = false;
        Button_odeslat_login.Visible = true;
        Button_login_zrusit.Visible = true;
        TextBox_login.Visible = true;
    }

    protected void Button_heslo_zrusit_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_zmenit_email_Click(object sender, EventArgs e)
    {
        Label_email.Visible = false;
        Button_zmenit_email.Visible = false;
        Button_odeslat_email.Visible = true;
        Button_email_zrusit.Visible = true;
        TextBox_email.Visible = true;
    }

    protected void Button_zmenit_jmeno_Click(object sender, EventArgs e)
    {
        Label_jmeno.Visible = false;
        Button_zmenit_jmeno.Visible = false;
        Button_odeslat_jmeno.Visible = true;
        Button_jmeno_zrusit.Visible = true;
        TextBox_jmeno.Visible = true;
    }

    protected void Button_zmenit_prijmeni_Click(object sender, EventArgs e)
    {
        Label_prijmeni.Visible = false;
        Button_zmenit_prijmeni.Visible = false;
        Button_odeslat_prijmeni.Visible = true;
        Button_prijmeni_zrusit.Visible = true;
        TextBox_prijmeni.Visible = true;
    }

    protected void Button_zmenit_heslo_Click(object sender, EventArgs e)
    {
        Label_heslo.Visible = false;
        Button_zmenit_heslo.Visible = false;
        Button_odeslat_heslo.Visible = true;
        Button_heslo_zrusit.Visible = true;
        TextBox_heslo.Visible = true;
        TextBox_heslo2.Visible = true;
    }

    protected void Button_login_zrusit_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_email_zrusit_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_jmeno_zrusit_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_prijmeni_zrusit_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_odeslat_login_Click(object sender, EventArgs e)
    {
        if (TextBox_login.Text != "")
        {
            try
            {
                DB.updateUserLogin(TextBox_login.Text, id_user);
                Session["flashMsgType"] = "success";
                Session["flashMsgText"] = "Login byl úspěšně změněn.";
            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Chyba. Kontaktujte programátory. Text chyby:" + ex.Message;
            }
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Musíte zadat login.";
        }
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_odeslat_email_Click(object sender, EventArgs e)
    {
        string pattern = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
        Regex regex = new Regex(pattern);
        if (TextBox_email.Text != "" && regex.IsMatch(TextBox_email.Text))
        {
            try
            {
                DB.updateUserEmail(TextBox_email.Text, id_user);
                Session["flashMsgType"] = "success";
                Session["flashMsgText"] = "Email byl úspěšně změněn.";
            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Chyba. Kontaktujte programátory. Text chyby:" + ex.Message;
            }
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Email nemá správný formát nebo nebyl zadán.";
        }
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_odeslat_jmeno_Click(object sender, EventArgs e)
    {
        if (TextBox_jmeno.Text != "")
        {
            try
            {
                DB.updateUserJmeno(TextBox_jmeno.Text, id_user);
                Session["flashMsgType"] = "success";
                Session["flashMsgText"] = "Jméno bylo úspěšně změněno.";
            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Chyba. Kontaktujte programátory. Text chyby:" + ex.Message;
            }
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Musíte zadat jméno.";
        }
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_odeslat_prijmeni_Click(object sender, EventArgs e)
    {
        if (TextBox_prijmeni.Text != "")
        {
            try
            {
                DB.updateUserPrijmeni(TextBox_prijmeni.Text, id_user);
                Session["flashMsgType"] = "success";
                Session["flashMsgText"] = "Příjmení bylo úspěšně změněno.";
            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Chyba. Kontaktujte programátory. Text chyby:" + ex.Message;
            }
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Musíte zadat příjmení.";
        }
        Response.Redirect(Request.RawUrl);
    }

    protected void Button_odeslat_heslo_Click(object sender, EventArgs e)
    {
        if (TextBox_heslo.Text != "" && TextBox_heslo2.Text != "" && TextBox_heslo.Text == TextBox_heslo2.Text)
        {
            try
            {
                HashPw hp = new HashPw();
                string heslo = hp.HashString(TextBox_heslo.Text);
                DB.updateUserHeslo(heslo, id_user);
                Session["flashMsgType"] = "success";
                Session["flashMsgText"] = "Heslo bylo úspěšně změněno.";
            }
            catch (Exception ex)
            {
                Session["flashMsgType"] = "danger";
                Session["flashMsgText"] = "Chyba. Kontaktujte programátory. Text chyby:" + ex.Message;
            }
        }
        else
        {
            Session["flashMsgType"] = "danger";
            Session["flashMsgText"] = "Hesla se neshodují nebo nebyla zadána.";
        }
        Response.Redirect(Request.RawUrl);
    }
}