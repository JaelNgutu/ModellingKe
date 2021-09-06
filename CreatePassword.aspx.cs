using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreatePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Click(object sender, EventArgs e)
    {
        changePassword();
    }

    private void changePassword()
    {
        byte[] salt;

        new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
        var pbkdf2 = new Rfc2898DeriveBytes(TextBoxNewPwd.Text, salt, 10000);

        byte[] hash = pbkdf2.GetBytes(20);
        byte[] hashBytes = new byte[36];

        Array.Copy(salt, 0, hashBytes, 0, 16);
        Array.Copy(hash, 0, hashBytes, 16, 20);

        string savedPasswordHash = Convert.ToBase64String(hashBytes);

        int UserID = Int32.Parse(Request["pID"].ToString());

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "UPDATE [userInfo] SET [password] = @pwd WHERE [userID] = @uid";
        SqlCommand com = new SqlCommand(insertQuery, conn);

        com.Parameters.AddWithValue("@pwd", savedPasswordHash);
        com.Parameters.AddWithValue("@uid", UserID);

        com.ExecuteNonQuery();
        conn.Close();

        Session["UserID"] = UserID;

       
        Response.Redirect("~/bio.aspx");
    }
}