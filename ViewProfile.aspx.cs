using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string username = (Repeater1.FindControl("Label2") as Label).Text;
            MailMessage mailMessage = new MailMessage();


            mailMessage.To.Add("info@dmk.co.ke");
            mailMessage.From = new MailAddress(Email.Text, "DMK Job");
            mailMessage.Subject = "Job request";
           
          

            string body = " Job request for :" + username;
            body += "<br /><br />Message sent:";
            body += "<br /><br /> " + Message.Text;
            body += "<br /><br /> ";
            body += "<br /><a href = '" + HttpContext.Current.Request.Url.AbsoluteUri + "'>Click here to view user.</a>";

            mailMessage.Body = body;
            mailMessage.IsBodyHtml = true;

            SmtpClient smtpClient = new SmtpClient("dmk.co.ke");
            NetworkCredential Credentials = new NetworkCredential("info@dmk.co.ke", "sU7$zt21");
            smtpClient.Credentials = Credentials;
            mailMessage.Priority = MailPriority.High;
            smtpClient.Send(mailMessage);
           
            Message.Text = string.Empty;
            Email.Text = string.Empty;
           


        }
        catch (Exception ex)
        {
           

        }
    }
}