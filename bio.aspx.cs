using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonBio_Click(object sender, EventArgs e)
    {
        if (Session != null)
        {
            int userID = Convert.ToInt32(Session["UserID"]);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery = "UPDATE [userInfo] SET [bio] = @bio WHERE [userID] = @uid";
            SqlCommand com = new SqlCommand(insertQuery, conn);

            com.Parameters.AddWithValue("@bio", Bio.Text);
            com.Parameters.AddWithValue("@uid", userID);

            com.ExecuteNonQuery();
            conn.Close();


            Response.Redirect("~/EditProfile.aspx");
        }


        else
        {
            Response.Redirect("~/Login.aspx");
        }
     
    }
}