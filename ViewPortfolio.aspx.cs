using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewPortfolio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int thisUserID = Int32.Parse(Request["pID"]);
        int thisSession = Convert.ToInt32(Session["UserID"]);


        if (!IsPostBack)
        {
            if (Session["UserID"] == null)
            {
                (FormView1.FindControl("Button2") as LinkButton).Visible = false;

            }
            
            if (thisUserID != thisSession)
            {
                (FormView1.FindControl("Button2") as LinkButton).Visible = false;
            }
        }
    }


    protected void BtnPortFolio_Click(object sender, EventArgs e)
    {
        CreateFolder();
    }


    private void AddPortfolio()
    {

        if (FileUpload1.PostedFile != null)


        {
            string filename = FileUpload1.PostedFile.FileName.ToString();

            Regex illegalInFileName = new Regex(@"[\\/:*?"") \-(<>|\+]");
            filename = illegalInFileName.Replace(filename, "-");
           

            string fileExt = System.IO.Path.GetExtension(FileUpload1.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }



            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload1.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {
                int userID = Int32.Parse(Request["pID"]);

              

                var photo = "/Userimages/PortfolioImages/" + userID + "/" + filename;
                FileUpload1.SaveAs(Server.MapPath("~/Userimages/PortfolioImages/" + userID + "/" + filename));

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string insertQuery = "INSERT INTO [portfolio] ([userID],[image]) VALUES  (@uid,@photo)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@uid", userID );
                com.Parameters.AddWithValue("@photo", photo);

                com.ExecuteNonQuery();
                conn.Close();
                Response.Redirect(Request.RawUrl);

            }

        }

    }

    private void CreateFolder()
    {
       
                int thisSession = Convert.ToInt32(Session["UserID"]);

                string folderPath = Path.Combine(Server.MapPath("~/Userimages/PortfolioImages/" + thisSession));

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(folderPath);
            AddPortfolio();

        }

        else
        {
            AddPortfolio();
        }




    }

}