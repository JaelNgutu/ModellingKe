using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RegisteredUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string status = (FormView1.FindControl("LabelStatus") as Label).Text;

            if (status == "Active")
            {
                (FormView1.FindControl("ButtonDPost") as Button).Visible = false;
            }

            else if (status == "Pending")
            {
                (FormView1.FindControl("ButtonDeact") as Button).Visible = false;
            }
        }
    }

    protected void ButtonActivate_Click(object sender, EventArgs e)
    {

        int userID = Int32.Parse(Request["pID"].ToString());

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "UPDATE [userInfo] SET [status] = @status WHERE [userID] = @uid";
        SqlCommand com = new SqlCommand(insertQuery, conn);

        com.Parameters.AddWithValue("@status", "Active");
        com.Parameters.AddWithValue("@uid", userID);

        com.ExecuteNonQuery();
        conn.Close();
        SendActivationEmail(userID);

        Response.Redirect(Request.RawUrl);

    }


    private void SendActivationEmail(int userId)
    {
        int userID = Int32.Parse(Request["pID"].ToString());
        string email = (FormView1.FindControl("Label4") as Label).Text;
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string activationCode = Guid.NewGuid().ToString();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO userActivation VALUES(@UserId, @ActivationCode)"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        using (MailMessage mm = new MailMessage())
        {
            string username = (FormView1.FindControl("Label2") as Label).Text;
            string path_and_query = "http://localhost:59389/CreatePassword/?ActivationCode=" + activationCode + "&pID=" + userId;
            mm.To.Add(email);
            mm.From = new MailAddress("info@dmk.co.ke", "Digital Models Kenya");

            mm.Subject = "Account Activation";
            string body = " Hello " + username + ", ";
            body += "<br /><br /><h2>Congratulations your account for digital models kenya has been approved!</h2>";
            body += "<br /><br />Please click the following link to activate your account";
            body += "<br /><a href = '" + path_and_query + "'>Click here to activate your account.</a>";
            body += "<br /><br />Thanks";
            mm.Body = body;
            mm.IsBodyHtml = true;
            SmtpClient smtpClient = new SmtpClient("dmk.co.ke");
            NetworkCredential Credentials = new NetworkCredential("info@dmk.co.ke", "sU7$zt21");
            smtpClient.Credentials = Credentials;
            mm.Priority = MailPriority.High;
            smtpClient.Send(mm);
        }
    }

    protected void ButtonDeact_Click(object sender, EventArgs e)
    {
        int userID = Int32.Parse(Request["pID"].ToString());

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "UPDATE [userInfo] SET [status] = @status WHERE [userID] = @uid";
        SqlCommand com = new SqlCommand(insertQuery, conn);
        string deleteQuery = "DELETE FROM [userActivation] WHERE [userID] = @uid";
        SqlCommand com2 = new SqlCommand(deleteQuery, conn);

        com.Parameters.AddWithValue("@status", "Pending");
        com.Parameters.AddWithValue("@uid", userID);
        com2.Parameters.AddWithValue("@uid", userID);

        com.ExecuteNonQuery();
        com2.ExecuteNonQuery();
        conn.Close();


        Response.Redirect(Request.RawUrl);
    }

    private void deleteAccount()
    {
        int userID = Int32.Parse(Request["pID"].ToString());
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();

        string deletequery1 = "DELETE FROM [portfolio] WHERE [userID]=@uid";
        string deletequery2 = "DELETE FROM [userinfo] WHERE [userID]=@uid";

        SqlCommand com1 = new SqlCommand(deletequery1, conn);
        SqlCommand com2 = new SqlCommand(deletequery2, conn);

        com1.Parameters.AddWithValue("@uid", userID);
        com2.Parameters.AddWithValue("@uid", userID);
     

        com1.ExecuteNonQuery();
        com2.ExecuteNonQuery();

        conn.Close();

        Response.Redirect("~/Admin/AdminHome.aspx");

       

        
    }


    private void updateBio()
    {
        int userID = Int32.Parse(Request["pID"].ToString());

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "UPDATE [userInfo] SET [bio] = @bio WHERE [userID] = @uid";
        SqlCommand com = new SqlCommand(insertQuery, conn);

        com.Parameters.AddWithValue("@bio", Bio.Text);
        com.Parameters.AddWithValue("@uid", userID);

        com.ExecuteNonQuery();
        conn.Close();


        Response.Redirect(Request.RawUrl);
    }

    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        deleteAccount();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //update bio

        updateBio();
    }
}