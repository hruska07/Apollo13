using System;
using System.Security.Cryptography;
using System.Text;

public class HashPw
{
       public string HashString(string inputString, string hashName= "SHA256")
    {
        var algorithm = HashAlgorithm.Create(hashName);
        if (algorithm == null)
            throw new ArgumentException("Unrecognized hash name", hashName);

        byte[] hash = algorithm.ComputeHash(Encoding.UTF8.GetBytes(inputString));
        return Convert.ToBase64String(hash);
    }
}