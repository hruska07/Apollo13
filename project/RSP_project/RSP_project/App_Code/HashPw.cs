using System;
using System.Security.Cryptography;
using System.Text;

public class HashPw
{
    public string HashString(string clean, string Hfunkce = "SHA256")
    {
        var hashovani = HashAlgorithm.Create(Hfunkce);
        if (hashovani == null)
            throw new ArgumentException("Unrecognized hash name", Hfunkce);

        byte[] hash = hashovani.ComputeHash(Encoding.UTF8.GetBytes(clean));
        return Convert.ToBase64String(hash);
    }
}


