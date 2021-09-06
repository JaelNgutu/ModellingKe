using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    protected void Button1_Click(object sender, EventArgs e)
    {


        try
        {
            MailMessage mailMessage = new MailMessage();


            mailMessage.To.Add("info@dmk.co.ke");
            mailMessage.From = new MailAddress(email.Text,fname.Text + " " + lname.Text);
            mailMessage.Subject = subject.Text;
            mailMessage.Body = message.Text;
            SmtpClient smtpClient = new SmtpClient("dmk.co.ke");
            NetworkCredential Credentials = new NetworkCredential("info@dmk.co.ke", "sU7$zt21");
            smtpClient.Credentials = Credentials;
            mailMessage.Priority = MailPriority.High;
            smtpClient.Send(mailMessage);
            email.Text = string.Empty;
            fname.Text = string.Empty;
            lname.Text = string.Empty;
            subject.Text = string.Empty;


        }
        catch (Exception ex)
        {
            subject.Text = ("Could not send the e-mail - error: ");

        }
    }
}