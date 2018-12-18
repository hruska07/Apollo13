using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System;
using System.Web;
using System.Globalization;

/// <summary>
/// Třída pro napojení na DB
/// </summary>
public class Database
{
    private static SqlConnection conn = null;

    private string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString_seznam_volnych_clanku"].ConnectionString;

    //Pro Lokalni DB (Apollo13.mdf) odkomentuj nasledujici a take radky v SECRET.CONFIG:
    //private string ConnectionString = ConfigurationManager.ConnectionStrings["LokalniDB"].ConnectionString;

    /// <summary>
    /// Otevře (pokud není) a vrátí připojení k DB
    /// </summary>
    /// <returns>SqlConnection</returns>
    public SqlConnection getConnection() {
        if (conn == null) {
            conn = new SqlConnection(ConnectionString);
            conn.Open();
        }
        return conn;
    }

    public void pridelOponenty(int clanek, string datum_vyrizeni, int oponent, int oponent2)
    {
        SqlCommand insert = new SqlCommand("insert into Propoj_clanek_oponent (clanek, oponent, datum_vyrizeni) values (@clanek, @oponent, @datum_vyrizeni), (@clanek, @oponent2, @datum_vyrizeni)", getConnection());
        insert.Parameters.AddWithValue("@clanek", clanek);
        insert.Parameters.AddWithValue("@oponent", oponent);
        insert.Parameters.AddWithValue("@oponent2", oponent2);
        insert.Parameters.AddWithValue("@datum_vyrizeni", DateTime.Parse(datum_vyrizeni, CultureInfo.CreateSpecificCulture("cs-CZ")));

        SqlCommand get_ID_stav = new SqlCommand("SELECT [id_stav] FROM [Stav] WHERE [nazev_stav] = @nazev_stav", getConnection());
        get_ID_stav.Parameters.AddWithValue("@nazev_stav", "ceka_na_posudek");
        int id_stav = (int)get_ID_stav.ExecuteScalar();
        SqlCommand update = new SqlCommand("update Clanek set stav=@id_stav Where id_clanek=@clanek", conn);
        update.Parameters.AddWithValue("@id_stav", id_stav);
        update.Parameters.AddWithValue("@clanek", clanek);

        insert.ExecuteNonQuery();
        update.ExecuteNonQuery();
    }

    public void addFlashMsg(string type, string message)
    {
        SqlCommand insert = new SqlCommand("INSERT INTO [Notifikace] (typ_notifikace, zprava, [user]) VALUES (@typ_notifikace, @zprava, @user)", getConnection());
        insert.Parameters.AddWithValue("@typ_notifikace", type);
        insert.Parameters.AddWithValue("@zprava", message);
        insert.Parameters.AddWithValue("@user", HttpContext.Current.Session["id_user"].ToString());
        insert.ExecuteNonQuery();
    }

    public void InsertUser(string jmeno, string prijmeni, string login, string pass1, string role, string email)
    {
        SqlCommand insert = new SqlCommand("insert into [User] (jmeno, prijmeni,login, password,role,email) values(@jmeno, @prijmeni,@login, @password,@role,@email)", conn);
        insert.Parameters.AddWithValue("@jmeno", jmeno);
        insert.Parameters.AddWithValue("@prijmeni", prijmeni);
        insert.Parameters.AddWithValue("@login", login);
        insert.Parameters.AddWithValue("@password", pass1);
        insert.Parameters.AddWithValue("@role", role);
        insert.Parameters.AddWithValue("@email", email);
        insert.ExecuteNonQuery();

    }
    public void checkExistReg(string login,string email,out int LoginExist,out int EmailExist)
    {
        SqlCommand check_Login = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE ([login] = @login)", conn);
        SqlCommand check_Email = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE ([email] = @email)", conn);
        check_Login.Parameters.AddWithValue("@login", login);
        check_Email.Parameters.AddWithValue("@email", email);
        //zaznamenani jestli probehl select
        LoginExist = (int)check_Login.ExecuteScalar();
        EmailExist = (int)check_Email.ExecuteScalar();
    }
    public string GetRole(string role)
    {
        SqlCommand get_ID_role = new SqlCommand("SELECT id_role FROM [Role] WHERE ([nazev] = @nazev)", getConnection());
        get_ID_role.Parameters.AddWithValue("@nazev", role);
        return get_ID_role.ExecuteScalar().ToString();
    }

    public DataRow getUserById(int id_user)
    {
        SqlCommand select = new SqlCommand("SELECT * FROM [User] INNER JOIN [Role] ON [User].role = [Role].id_role WHERE id_user = @id_user", getConnection());
        select.Parameters.AddWithValue("@id_user", id_user);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        return ds.Tables[0].Rows[0];
    }

    public DataRow getClanekById(int id_clanek)
    {
        SqlCommand select = new SqlCommand("SELECT *, ([User].[jmeno] +' '+ [User].[prijmeni]) AS [cele_jmeno] FROM [Clanek] JOIN [User] ON [User].id_user = [Clanek].autor WHERE id_clanek = @id_clanek", getConnection());
        select.Parameters.AddWithValue("@id_clanek", id_clanek);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        return ds.Tables[0].Rows[0];
    }

    public void aktualizovatStavClanku(int id_clanek, int novy_stav)
    {
        SqlCommand update = new SqlCommand("UPDATE [Clanek] SET [stav] = @stav WHERE [id_clanek] = @id_clanek", getConnection());
        update.Parameters.AddWithValue("@id_clanek", id_clanek);
        update.Parameters.AddWithValue("@stav", novy_stav);
        update.ExecuteNonQuery();
    }

    public void insertNotification(int user, int clanek, string typ_notifikace, string zprava)
    {
        SqlCommand delete = new SqlCommand("DELETE FROM [Notifikace] WHERE [user] = @user AND [typ_notifikace] = @typ_notifikace AND [clanek] = @clanek", getConnection());
        delete.Parameters.AddWithValue("@user", user);
        delete.Parameters.AddWithValue("@typ_notifikace", typ_notifikace);
        delete.Parameters.AddWithValue("@clanek", clanek);
        delete.ExecuteNonQuery();

        SqlCommand insert = new SqlCommand("INSERT INTO [Notifikace] (typ_notifikace, zprava, [user], clanek) VALUES (@typ_notifikace, @zprava, @user, @clanek)", getConnection());
        insert.Parameters.AddWithValue("@typ_notifikace", typ_notifikace);
        insert.Parameters.AddWithValue("@zprava", zprava);
        insert.Parameters.AddWithValue("@user", user);
        insert.Parameters.AddWithValue("@clanek", clanek);
        insert.ExecuteNonQuery();
    }

    public DataTable getNotifications(int user)
    {
        SqlCommand select = new SqlCommand("SELECT * FROM [Notifikace] WHERE [user] = @user AND typ_notifikace = 'info'", getConnection());
        select.Parameters.AddWithValue("@user", user);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        DataTable table = ds.Tables[0];
        return table;
    }

    public void deleteNotificationsAndFlashMsg(int user)
    {
        SqlCommand delete = new SqlCommand("DELETE FROM [Notifikace] WHERE [user] = @user", getConnection());
        delete.Parameters.AddWithValue("@user", user);
        delete.ExecuteNonQuery();
    }

    public DataRow getFĺashMsgs(int user)
    {
        SqlCommand select = new SqlCommand("SELECT * FROM [Notifikace] WHERE [user] = @user AND (typ_notifikace = 'success' OR typ_notifikace = 'danger')", getConnection());
        select.Parameters.AddWithValue("@user", user);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        DataTable table = ds.Tables[0];
        return (table.Rows.Count > 0 ? table.Rows[0] : null);
    }
}