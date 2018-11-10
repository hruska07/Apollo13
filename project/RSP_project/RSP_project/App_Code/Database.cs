using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Třída pro napojení na DB
/// </summary>
public class Database
{
    private static SqlConnection conn = null;

    private string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString_seznam_volnych_clanku"].ConnectionString;

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

    ~Database() {
        if (conn != null)
            conn.Close();
    }
    
}