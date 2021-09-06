using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Blog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void addVid_Click(object sender, EventArgs e)
    {
        string videoUrl = Bio.Text;

        string video = Bio.Text.Replace("watch?v=", "embed/");

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "INSERT INTO [videos] ([video],[watch]) VALUES  (@vid,@watch)";
        SqlCommand com = new SqlCommand(insertQuery, conn);
        com.Parameters.AddWithValue("@vid", video);
        com.Parameters.AddWithValue("@watch", Bio.Text);



        com.ExecuteNonQuery();
        conn.Close();
        Response.Redirect(Request.RawUrl);
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int eventID = Convert.ToInt32(e.CommandArgument);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string deleteQuery = "DELETE FROM [videos] WHERE  Id=@uid";
        SqlCommand com = new SqlCommand(deleteQuery, conn);

        com.Parameters.AddWithValue("@uid", eventID);

        com.ExecuteNonQuery();
        conn.Close();
        Response.Redirect(Request.RawUrl);
    }
}