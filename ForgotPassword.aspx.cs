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

public partial class ForgotPassword : System.Web.UI.Page
{
    private string first;

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }

    protected void Button_Click(object sender, EventArgs e)
    {

    CheckEmailAvailability();

      
     

    }


    private void CheckEmailAvailability()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand command = new SqlCommand("EmailAvailability", con);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@Email", SqlDbType.VarChar, 200);
        command.Parameters["@Email"].Value = TextBoxNewPwd.Text;
        command.Parameters.Add("@EmailCount", SqlDbType.Int);
        command.Parameters["@EmailCount"].Direction = ParameterDirection.Output;

        int count = 0;

        try
        {
            con.Open();
            command.ExecuteNonQuery();
            count = Convert.ToInt32(command.Parameters["@EmailCount"].Value);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }

        if (count >= 1)
        {
            UserInfo();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "checkDelete()", true);
          
        }
        else
        {

           
            Label1.Visible = true;
        }
    }

    private void SendActivationEmail(int userId,string firstName,string lastName)
    {
        string resetCode = Guid.NewGuid().ToString();
        string email = TextBoxNewPwd.Text;
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string link = Guid.NewGuid().ToString();
       
        using (MailMessage mm = new MailMessage())
        {


            string path_and_query = "http://dmk.co.ke/ResetPassword/?ResetCode=" + resetCode + "&pID=" + userId;

            mm.To.Add(email);
            mm.From = new MailAddress("info@dmk.co.ke", "Digital Models Kenya");
            mm.Subject = "Reset password";
            string body = " Hello " + firstName + "" + lastName + ", ";
            body += "<br /><br />We received a request to reset your digital models kenya password";
            body += "<br /><br />Please click the link below to set a new one";
            body += "<br /><a href = '" + path_and_query + "'>Click here to activate your account.</a>";
            body += "<br /><br />if you ignore this message, your password will not be changed";
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

    private void UserInfo()
    {
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Login_Check_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", TextBoxNewPwd.Text);


            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {
                
                 string useID = dt.Rows[0][0].ToString().Trim();
                int userID = Convert.ToInt32(useID);

                string first;
                first = dt.Rows[0][1].ToString();

                string last;
                last = dt.Rows[0][2].ToString();

                SendActivationEmail (userID, first, last);

            }

            else
            {
                //LabelError.Visible = true;
            }
        }
        catch (Exception ex)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Oops!! following error occured : " + ex.Message.ToString() + "');", true);
            Response.Write("Oops!! following error occured: " + ex.Message.ToString());
        }
        finally
        {
            //dt.Clear();
            dt.Dispose();
            adp.Dispose();
        }



    }

}