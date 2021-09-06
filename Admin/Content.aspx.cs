using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            string filename = FileUpload1.PostedFile.FileName.ToString();
            filename ="contact.jpg";
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
              
                FileUpload1.SaveAs(Server.MapPath("~/WebsiteImages/" + filename));
                string message = "Contact page image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (FileUpload2.PostedFile != null)
        {
            string filename = FileUpload2.PostedFile.FileName.ToString();
            filename = "blog.jpg";
            string fileExt = System.IO.Path.GetExtension(FileUpload2.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload2.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {

                FileUpload2.SaveAs(Server.MapPath("~/WebsiteImages/" + filename));
                string message = "Blog page image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (FileUpload3.PostedFile != null)
        {
            string filename = FileUpload3.PostedFile.FileName.ToString();
            filename = "event.jpg";
            string fileExt = System.IO.Path.GetExtension(FileUpload3.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload3.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {

                FileUpload3.SaveAs(Server.MapPath("~/WebsiteImages/" + filename));
                string message = "Events page image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (FileUpload4.PostedFile != null)
        {
            string filename = FileUpload4.PostedFile.FileName.ToString();
            filename = "portfolio.jpg";
            string fileExt = System.IO.Path.GetExtension(FileUpload4.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload4.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {

                FileUpload4.SaveAs(Server.MapPath("~/WebsiteImages/" + filename));
                string message = "Portfolio page image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        if (FileUpload5.PostedFile != null)
        {
            string filename = FileUpload5.PostedFile.FileName.ToString();
            filename = "image1.jpg";
            string fileExt = System.IO.Path.GetExtension(FileUpload5.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload5.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {

                FileUpload5.SaveAs(Server.MapPath("~/WebsiteImages/HomePage_Images/" + filename));
                string message = "Homepage image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        if (FileUpload6.PostedFile != null)
        {
            string filename = FileUpload6.PostedFile.FileName.ToString();
            filename = "image2.jpg";
            string fileExt = System.IO.Path.GetExtension(FileUpload6.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload6.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {

                FileUpload6.SaveAs(Server.MapPath("~/WebsiteImages/HomePage_Images/" + filename));
                string message = "Homepage image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        if (FileUpload7.PostedFile != null)
        {
            string filename = FileUpload7.PostedFile.FileName.ToString();
            filename = "image3.jpg";
            string fileExt = System.IO.Path.GetExtension(FileUpload7.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload7.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {

                FileUpload7.SaveAs(Server.MapPath("~/WebsiteImages/HomePage_Images/" + filename));
                string message = "Homepage image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        if (FileUpload8.PostedFile != null)
        {
            string filename = FileUpload8.PostedFile.FileName.ToString();
            filename = "footer.jpg";
            string fileExt = System.IO.Path.GetExtension(FileUpload8.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload8.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {

                FileUpload8.SaveAs(Server.MapPath("~/WebsiteImages/" + filename));
                string message = "Bottom website image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }


    protected void Button9_Click(object sender, EventArgs e)
    {
        if (FileUpload9.PostedFile != null)
        {
            string filename = FileUpload9.PostedFile.FileName.ToString();
            filename = "woman.jpg";
            string fileExt = System.IO.Path.GetExtension(FileUpload9.FileName);

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {


            }
            else if (FileUpload9.PostedFile.ContentLength > 10000000)
            {


            }

            //save image to folder
            else
            {

                FileUpload9.SaveAs(Server.MapPath("~/images/" + filename));
                string message = "Signup page  image changed successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


            }

        }

    }
}
