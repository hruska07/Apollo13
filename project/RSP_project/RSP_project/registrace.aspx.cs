using System;
using System.Data;
using System.Data.SqlClient;

public partial class registrace : System.Web.UI.Page
{
    private Database DB = new Database();
    private SqlConnection conn = null;
    Notifications nf = new Notifications();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB.getConnection();
    }

    protected void Button_register_Click(object sender, EventArgs e)
    {
        //kontrola zda je vše vyplněné
        if (validator_email.IsValid == true && validator_heslo.IsValid == true && validator_jmeno.IsValid == true
        && validator_login.IsValid == true && validator_prijmeni.IsValid == true && CompareValidator_stejnaPW.IsValid == true && RegularExpressionValidator_email.IsValid==true)
        {
            //nacteni dat do promennych
            string login = TextBox_login.Text;
            string jmeno = TextBox_jmeno.Text;
            string prijmeni = TextBox_prijmeni.Text;
            string email = TextBox_email.Text;
            string pass1, pass2;
            //hashovani hesla
            HashPw hp = new HashPw();
            pass1 = hp.HashString(TextBox_password1.Text);
            pass2 = hp.HashString(TextBox_password2.Text);
            //prirazeni id role podle nazvu
            string role = DB.GetRole(rbl_role.SelectedValue);
            //kontrola existence emailu nebo loginu v db
            int LoginExist, EmailExist;
            DB.checkExistReg(login, email, out LoginExist, out EmailExist);
            if (LoginExist > 0 || EmailExist > 0)
            {
                //jestli existuje vypíše se co je zabráné
                Label_output.Text = Label_output2.Text = "";
                if (LoginExist > 0)
                {
                    Label_output.Text += "Vybraný login je již zabrán ";
                    Label_output.Visible = true;
                }
                if (EmailExist > 0)
                {
                    Label_output2.Visible = true;
                    Label_output2.Text += "Email je již zaregistrován";
                }
            }
            else
            {
                try//zkouseni vlozeni do db
                {
                    DB.InsertUser(jmeno, prijmeni, login, pass1, role, email);
                    Label_output.Text = "Účet úspěšně vytvořen s rolí: " + rbl_role.SelectedItem.Text;
                    Label_output.Visible = true;
                    Label_output.ForeColor = System.Drawing.Color.CornflowerBlue;
                    //email notifikace
                    string message = "Vaše registrace na Logos Polytechikos Appola 13 proběhla úspěšně\n Vaš login je: " + login + "\n V případě nejasností odpovězte na tento email\n\n Tým Logos Polytechnikos\n www.lpApollo13.azurewebsites.net";
                    nf.sendEmail(TextBox_email.Text, "Registrace Logos Polytechnikos", message);
                    //notifikace - stranky
                    Session["flashMsgType"] = "success";
                    Session["flashMsgText"] = "Registrace proběhla úspěšně. Účet byl vytvořen";
                    //notifikace - admin

                    //email notifikace admina
                    DataTable users = DB.getAdmin();
                    message = "Byl zaregistrován uživatel s loginem: " + login + ".\n Zkontrolujte jeho roli.";
                    foreach (DataRow user in users.Rows)
                    {
                        DB.insertNotification(int.Parse(user["id_user"].ToString()), message);
                        nf.sendEmail(user["email"].ToString(), "Nový uživatel byl zaregistrován", message);
                    }
                    try
                    {
                        if (rbl_role.SelectedItem.Text == "Autor")
                        {
                            //DB.getUserByLogin(login);
                            SqlCommand select = new SqlCommand("SELECT * FROM [User] INNER JOIN [Role] ON [User].role = [Role].id_role WHERE login = @login", DB.getConnection());
                            select.Parameters.AddWithValue("@login", login);
                            sda.SelectCommand = select;
                            sda.Fill(ds, "User");
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                //-- UKLADANI DO SESSION
                                Session["id_user"] = ds.Tables[0].Rows[0]["id_user"].ToString();
                                Session["nazev_role"] = ds.Tables[0].Rows[0]["nazev"].ToString();
                                Session["id_role"] = ds.Tables[0].Rows[0]["role"].ToString();
                                Session.Timeout = 5;
                                Response.Redirect("/default");
                            }
                        }
                        Response.Redirect("/default");
                    }
                    catch (Exception) { }
                }
                catch (Exception ex)//kdyz neprobehne vyhodi se error
                {
                    Label_output.Text = "Error: " + ex.Message;
                    Label_output.Visible = true;
                }
            }

        }
    }
}
