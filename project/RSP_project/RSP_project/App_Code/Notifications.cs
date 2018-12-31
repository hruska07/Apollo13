using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Souhrnný popis pro Notifications
/// </summary>
public class Notifications
{
    Database DB = new Database();

    public Notifications() { }

    public void sendEmail(string recipients, string subject, string body)
    {
        bool test = false;
        if (test)
        {
            var client = new SmtpClient("127.0.0.1", 25);
            string from = "logospolytechnikos@gmail.com";
            client.Send(from, recipients, subject, body);
        }
        else
        {
            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new System.Net.NetworkCredential("logospolytechnikos@gmail.com", "#a1s2d3f4"),
                EnableSsl = true
            };
            string from = "logospolytechnikos@gmail.com";
            client.Send(from, recipients, subject, body);
        }
    }
}