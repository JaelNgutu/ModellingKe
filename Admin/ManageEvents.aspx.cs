using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void addEvent_Click(object sender, EventArgs e)
    {
        EventAdd();
    }

    private void EventAdd()
    {

        if (FileUploadPic.PostedFile != null)


        {
            string filename = FileUploadPic.PostedFile.FileName.ToString();

            Regex illegalInFileName = new Regex(@"[\\/:*?"") \-(<>|\+]");
            filename = illegalInFileName.Replace(filename, "-");


            string fileExt = System.IO.Path.GetExtension(FileUploadPic.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }



            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUploadPic.PostedFile.ContentLength > 4000000)
            {


            }

            //save image to folder
            else
            {
               

                var photo = "/Events/" + filename;
                FileUploadPic.SaveAs(Server.MapPath("~/Events/" + filename));

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string insertQuery = "INSERT INTO [Events] ([image]) VALUES  (@photo)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
               
                com.Parameters.AddWithValue("@photo", photo);

                com.ExecuteNonQuery();
                conn.Close();
                Response.Redirect(Request.RawUrl);

            }

        }

    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
       int eventID = Convert.ToInt32(e.CommandArgument);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string deleteQuery = "DELETE FROM [Events] WHERE  eventID=@uid";
        SqlCommand com = new SqlCommand(deleteQuery, conn);

        com.Parameters.AddWithValue("@uid", eventID);

        com.ExecuteNonQuery();
        conn.Close();
        Response.Redirect(Request.RawUrl);
    }
}