using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class Admin_AddAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }


        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        createAdmin();
    }

    protected void createAdmin()
    {
        string mypass = password.Text;

        byte[] salt;

        new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
        var pbkdf2 = new Rfc2898DeriveBytes(mypass, salt, 10000);

        byte[] hash = pbkdf2.GetBytes(20);
        byte[] hashBytes = new byte[36];

        Array.Copy(salt, 0, hashBytes, 0, 16);
        Array.Copy(hash, 0, hashBytes, 16, 20);

        string savedPasswordHash = Convert.ToBase64String(hashBytes);



        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;



        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "INSERT INTO [AdminDetails] ([Email],[Password]) VALUES (@email,@pass)";
        SqlCommand com = new SqlCommand(insertQuery, conn);
        com.Parameters.AddWithValue("@email", Email.Text);
        com.Parameters.AddWithValue("@pass", savedPasswordHash);


        com.ExecuteNonQuery();

        conn.Close();

        Email.Text = string.Empty;


        Response.Redirect(Request.RawUrl);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Admin/Login.aspx");
    }
}