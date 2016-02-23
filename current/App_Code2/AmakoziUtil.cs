using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Reverser
/// </summary>
public class AMKUtil
{
    public static String secure_email(String email)
    {
        char[] characters = email.ToCharArray();
        Array.Reverse(characters);
        return "<span class=\"codedirection\">" + new String(characters) + "</span>";
    }
}