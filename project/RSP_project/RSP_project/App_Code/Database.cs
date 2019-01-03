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

    public DataRow getAktualniCasopisByTema(int tema)
    {
        SqlCommand select = new SqlCommand("SELECT TOP 1 [Casopis].[id_casopis], [Casopis].[datum_uzaverky], [Casopis].[kapacita], (SELECT COUNT(*) FROM [Clanek] WHERE [Clanek].[casopis] = [Casopis].[id_casopis]) AS [pocet_clanku] FROM [Casopis] WHERE [Casopis].[tema] = @tema ORDER BY [Casopis].[datum_uzaverky] DESC", getConnection());
        select.Parameters.AddWithValue("@tema", tema);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        DataRow casopis = null;
        if (ds.Tables[0].Rows.Count > 0)
        {
            casopis = ds.Tables[0].Rows[0];
            var temp1 = casopis["datum_uzaverky"].ToString();
            var temp2 = casopis["kapacita"].ToString();
            var temp3 = casopis["pocet_clanku"].ToString();
            if (((DateTime)casopis["datum_uzaverky"] > DateTime.Now) && ((int)casopis["pocet_clanku"] < (int)casopis["kapacita"]))
            {
                return casopis;
            }
        }

        //select.Parameters.AddWithValue("@ted", DateTime.Now);
        DateTime datum_uzaverky = new DateTime();

        SqlCommand select2 = new SqlCommand("SELECT [Tema].[datum_uzaverky] FROM [Tema] WHERE [Tema].[id_tema] = @tema", getConnection());
        select2.Parameters.AddWithValue("@tema", tema);
        string datum_uzaverky_string = (string)select2.ExecuteScalar();
        int rok;
        if (casopis == null)
            rok = DateTime.Now.Year;
        else
            rok = int.Parse(((DateTime)casopis["datum_uzaverky"]).ToString("yyyy")) + 1;
        datum_uzaverky = DateTime.Parse(datum_uzaverky_string + rok.ToString());

        if (datum_uzaverky <= DateTime.Now)
            datum_uzaverky = DateTime.Parse(datum_uzaverky_string + (rok + 1).ToString());

        int konecny_rok = int.Parse(datum_uzaverky.ToString("yyyy"));
        string oznaceni = String.Format("{0}/Ročník {1}/Číslo {2}", konecny_rok, konecny_rok % 100 - 9, tema);
        SqlCommand insert = new SqlCommand("INSERT INTO [Casopis] (tema, datum_uzaverky, oznaceni) OUTPUT INSERTED.id_casopis VALUES (@tema, @datum_uzaverky, @oznaceni)", getConnection());
        insert.Parameters.AddWithValue("@tema", tema);
        insert.Parameters.AddWithValue("@datum_uzaverky", datum_uzaverky);
        insert.Parameters.AddWithValue("@oznaceni", oznaceni);
        return getCasopisById((int)insert.ExecuteScalar());
    }

    public void removeClanekFromCasopis(int id_clanek)
    {
        SqlCommand update = new SqlCommand("UPDATE [Clanek] SET [casopis] = NULL WHERE [id_clanek] = @id_clanek", getConnection());
        update.Parameters.AddWithValue("@id_clanek", id_clanek);
        update.ExecuteNonQuery();
    }

    public void odeslatPosudek(string namety_k_diskuzi, char kriterium1, char kriterium2, char kriterium3, string doplnujici_komentar, int souhrnne_vyjadreni, int clanek, int oponent)
    {
        SqlCommand insert = new SqlCommand("insert into [Posudek] (namety_k_diskuzi, kriterium1, kriterium2, kriterium3, doplnujici_komentar, souhrnne_vyjadreni, clanek, oponent) values(@namety_k_diskuzi, @kriterium1, @kriterium2, @kriterium3, @doplnujici_komentar, @souhrnne_vyjadreni, @clanek, @oponent)", getConnection());
        insert.Parameters.AddWithValue("@namety_k_diskuzi", namety_k_diskuzi);
        insert.Parameters.AddWithValue("@kriterium1", kriterium1);
        insert.Parameters.AddWithValue("@kriterium2", kriterium2);
        insert.Parameters.AddWithValue("@kriterium3", kriterium3);
        insert.Parameters.AddWithValue("@doplnujici_komentar", doplnujici_komentar);
        insert.Parameters.AddWithValue("@souhrnne_vyjadreni", souhrnne_vyjadreni);
        insert.Parameters.AddWithValue("@clanek", clanek);
        insert.Parameters.AddWithValue("@oponent", oponent);
        insert.ExecuteNonQuery();

        SqlCommand get_ID_stav = new SqlCommand("SELECT [id_stav] FROM [Stav] WHERE [nazev_stav] = @nazev_stav", getConnection());
        get_ID_stav.Parameters.AddWithValue("@nazev_stav", "ma_posudek");
        int id_stav = (int)get_ID_stav.ExecuteScalar();
        SqlCommand update = new SqlCommand("update Clanek set stav=@id_stav Where id_clanek=@clanek", conn);
        update.Parameters.AddWithValue("@id_stav", id_stav);
        update.Parameters.AddWithValue("@clanek", clanek);
        update.ExecuteNonQuery();
    }

    public DataRow getCasopisById(int id_casopis)
    {
        SqlCommand select = new SqlCommand("SELECT *, (SELECT COUNT(*) FROM [Clanek] WHERE [Clanek].[casopis] = @id_casopis) AS [pocet_clanku] FROM [Casopis] WHERE [Casopis].[id_casopis] = @id_casopis", getConnection());
        select.Parameters.AddWithValue("@id_casopis", id_casopis);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        return ds.Tables[0].Rows[0];
    }

    public void insertClanek(string Nadpis, string Abstrakt, DateTime date1, int cislo_autora, int casopis, int soubor, string keywords, string autors, string workplace, string filename)
    {
        SqlCommand insert = new SqlCommand("insert into [Clanek] (nadpis_clanku, datum_clanku,autor,stav,casopis,soubor,abstrakt,keywords,autors,workplace,path) values(@Nadpis, @datum_clanku,@autor,@stav,@casopis,@soubor,@abstrakt,@keyw,@aut,@workpl,@patha)", getConnection());
        insert.Parameters.AddWithValue("@Nadpis", Nadpis);
        insert.Parameters.AddWithValue("@abstrakt", Abstrakt);
        insert.Parameters.AddWithValue("@datum_clanku", date1);
        insert.Parameters.AddWithValue("@autor", cislo_autora);
        insert.Parameters.AddWithValue("@stav", 1);
        insert.Parameters.AddWithValue("@casopis", casopis);
        insert.Parameters.AddWithValue("@soubor", soubor);
        insert.Parameters.AddWithValue("@keyw", keywords);
        insert.Parameters.AddWithValue("@aut", autors);
        insert.Parameters.AddWithValue("@workpl", workplace);
        insert.Parameters.AddWithValue("@patha", filename);
        insert.ExecuteNonQuery();
    }

    public void updateClanek(int id_clanek, string Nadpis, string Abstrakt, DateTime date1, int cislo_autora, int casopis, int soubor, string keywords, string autors, string workplace, string filename)
    {
        //ulozeni predchozi verze
        DataRow puv_clanek = getClanekById(id_clanek);
        SqlCommand insert = new SqlCommand("insert into [Clanek_predchozi_verze] (puvodni_clanek, nadpis_clanku, datum_clanku,autor,stav,casopis,soubor,abstrakt,keywords,autors,workplace,path) values(@puvodni_clanek, @Nadpis, @datum_clanku,@autor,@stav,@casopis,@soubor,@abstrakt,@keyw,@aut,@workpl,@patha)", getConnection());
        insert.Parameters.AddWithValue("@puvodni_clanek", id_clanek);
        insert.Parameters.AddWithValue("@Nadpis", puv_clanek["nadpis_clanku"]);
        insert.Parameters.AddWithValue("@abstrakt", puv_clanek["abstrakt"]);
        insert.Parameters.AddWithValue("@datum_clanku", puv_clanek["datum_clanku"]);
        insert.Parameters.AddWithValue("@autor", puv_clanek["autor"]);
        insert.Parameters.AddWithValue("@stav", puv_clanek["stav"]);
        insert.Parameters.AddWithValue("@casopis", puv_clanek["casopis"]);
        insert.Parameters.AddWithValue("@soubor", puv_clanek["soubor"]);
        insert.Parameters.AddWithValue("@keyw", puv_clanek["keywords"]);
        insert.Parameters.AddWithValue("@aut", puv_clanek["autors"]);
        insert.Parameters.AddWithValue("@workpl", puv_clanek["workplace"]);
        insert.Parameters.AddWithValue("@patha", puv_clanek["path"]);
        insert.ExecuteNonQuery();

        //aktualizace clanku
        SqlCommand update = new SqlCommand("update [Clanek] SET nadpis_clanku = @Nadpis, datum_clanku = @datum_clanku,autor = @autor,stav = @stav,casopis = @casopis,soubor = @soubor,abstrakt = @abstrakt,keywords = @keyw,autors = @aut,workplace = @workpl,path = @patha", getConnection());
        update.Parameters.AddWithValue("@Nadpis", Nadpis);
        update.Parameters.AddWithValue("@abstrakt", Abstrakt);
        update.Parameters.AddWithValue("@datum_clanku", date1);
        update.Parameters.AddWithValue("@autor", cislo_autora);
        update.Parameters.AddWithValue("@stav", 1);
        update.Parameters.AddWithValue("@casopis", casopis);
        update.Parameters.AddWithValue("@soubor", soubor);
        update.Parameters.AddWithValue("@keyw", keywords);
        update.Parameters.AddWithValue("@aut", autors);
        update.Parameters.AddWithValue("@workpl", workplace);
        update.Parameters.AddWithValue("@patha", filename);
        update.ExecuteNonQuery();
    }

    public void pridelOponenty(int clanek, string datum_vyrizeni, int oponent, int oponent2, int pridelil)
    {
        SqlCommand insert = new SqlCommand("insert into Propoj_clanek_oponent (clanek, oponent, datum_vyrizeni, pridelil) values (@clanek, @oponent, @datum_vyrizeni, @pridelil), (@clanek, @oponent2, @datum_vyrizeni, @pridelil)", getConnection());
        insert.Parameters.AddWithValue("@clanek", clanek);
        insert.Parameters.AddWithValue("@oponent", oponent);
        insert.Parameters.AddWithValue("@oponent2", oponent2);
        insert.Parameters.AddWithValue("@pridelil", pridelil);
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

    public DataRow getUserByLogin(string login)
    {
        SqlCommand select = new SqlCommand("SELECT * FROM [User] INNER JOIN [Role] ON [User].role = [Role].id_role WHERE login = @login", getConnection());
        select.Parameters.AddWithValue("@login", login);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        return ds.Tables[0].Rows[0];
    }

    public DataRow getClanekById(int id_clanek)
    {
        SqlCommand select = new SqlCommand("SELECT *, ([User].[jmeno] +' '+ [User].[prijmeni]) AS [cele_jmeno] FROM [Clanek] JOIN [User] ON [User].id_user = [Clanek].autor JOIN Casopis ON Clanek.casopis = Casopis.id_casopis WHERE id_clanek = @id_clanek", getConnection());
        select.Parameters.AddWithValue("@id_clanek", id_clanek);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        return ds.Tables[0].Rows[0];
    }

    public DataTable getRedaktori()
    {
        SqlCommand select = new SqlCommand("SELECT * FROM [User] WHERE role = 4", getConnection());
        SqlDataAdapter sda = new SqlDataAdapter();
        DataTable x = new DataTable();
        sda.SelectCommand = select;
        sda.Fill(x);
        return x;
    }

    public void aktualizovatStavClanku(int id_clanek, int novy_stav)
    {
        SqlCommand update = new SqlCommand("UPDATE [Clanek] SET [stav] = @stav WHERE [id_clanek] = @id_clanek", getConnection());
        update.Parameters.AddWithValue("@id_clanek", id_clanek);
        update.Parameters.AddWithValue("@stav", novy_stav);
        update.ExecuteNonQuery();
    }

    public void insertNotification(int user, string zprava)
    {
        SqlCommand insert = new SqlCommand("INSERT INTO [Notifikace] (zprava, [user]) VALUES (@zprava, @user)", getConnection());
        insert.Parameters.AddWithValue("@zprava", zprava);
        insert.Parameters.AddWithValue("@user", user);
        insert.ExecuteNonQuery();
    }

    public DataTable getNotifications(int user)
    {
        SqlCommand select = new SqlCommand("SELECT * FROM [Notifikace] WHERE [user] = @user", getConnection());
        select.Parameters.AddWithValue("@user", user);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = select;
        sda.Fill(ds);
        DataTable table = ds.Tables[0];
        if (table.Rows.Count > 0)
            deleteNotifications(user);
        return table;
    }

    public void deleteNotifications(int user)
    {
        SqlCommand delete = new SqlCommand("DELETE FROM [Notifikace] WHERE [user] = @user", getConnection());
        delete.Parameters.AddWithValue("@user", user);
        delete.ExecuteNonQuery();
    }
}