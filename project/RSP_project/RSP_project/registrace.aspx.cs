using System;
using System.Data.SqlClient;
using System.Web.Security;

public partial class registrace : System.Web.UI.Page
{
    Database DB = new Database();
    SqlConnection conn = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = DB.getConnection();
    }

    protected void Button_register_Click(object sender, EventArgs e)
    {
        if (validator_email.IsValid == true && validator_heslo.IsValid == true && validator_jmeno.IsValid == true
            && validator_login.IsValid == true && validator_prijmeni.IsValid == true && CompareValidator_stejnaPW.IsValid == true)
        {
            //nacteni dat do promennych
            string login = TextBox_login.Text;
            string jmeno = TextBox_jmeno.Text;
            string prijmeni = TextBox_prijmeni.Text;
            string email = TextBox_email.Text;
            string pass1, pass2;
            HashPw hp = new HashPw();
            pass1 = hp.HashString(TextBox_password1.Text);
            pass2 = hp.HashString(TextBox_password2.Text);

            string role = rbl_role.SelectedValue;
            SqlCommand get_ID_role = new SqlCommand("SELECT id_role FROM [Role] WHERE ([nazev] = @nazev)", conn);
            get_ID_role.Parameters.AddWithValue("@nazev", role);
            role = get_ID_role.ExecuteScalar().ToString();
            //KONTROLA TOHO ZDA LOGIN NEBO EMAIL NENI V UZ VYTVOREN
            SqlCommand check_Login = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE ([login] = @login)", conn);
            SqlCommand check_Email = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE ([email] = @email)", conn);
            check_Login.Parameters.AddWithValue("@login", login);
            check_Email.Parameters.AddWithValue("@email", email);
            //zaznamenani jestli probehl select
            int LoginExist = (int)check_Login.ExecuteScalar();
            int EmailExist = (int)check_Email.ExecuteScalar();
            if (LoginExist > 0 || EmailExist > 0)
            {
                Label_output.Text = Label_output2.Text = "";
                if (LoginExist > 0)
                    Label_output.Text += "Vybraný login je již zabrán ";
                if (EmailExist > 0)
                    Label_output2.Text += "Email je již zaregistrován";
            }
            else
            {
                try//zkouseni vlozeni do db
                {
                    DB.InsertUser(jmeno, prijmeni, login, pass1, role, email);
                    Label_output.Text = "Účet úspěšně vytvořen s rolí: " + rbl_role.SelectedItem.Text;
                    Label_output.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                catch (Exception ex)//kdyz neprobehne vyhodi se error
                {
                    Label_output.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
