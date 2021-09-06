using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }



    public void regUSer()
    {


        string bio = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;




        
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "INSERT INTO [userinfo] ([firstName],[lastName],[phoneNumber],[email],[age],[gender],[bio]) VALUES (@fname,@lname,@num,@email,@age,@gender,@bio)";
        SqlCommand com = new SqlCommand(insertQuery, conn);
        com.Parameters.AddWithValue("@fname", textInfo.ToTitleCase(tbFirstName.Value));
        com.Parameters.AddWithValue("@lname", textInfo.ToTitleCase(tbLastName.Value));
        com.Parameters.AddWithValue("@num", tbNumber.Value);
        com.Parameters.AddWithValue("@email", tbEmail.Value);
        com.Parameters.AddWithValue("@age", tbAge.Value);
        com.Parameters.AddWithValue("@gender", RadioButtonList1.SelectedValue);
        com.Parameters.AddWithValue("@bio", bio);



        com.ExecuteNonQuery();

        conn.Close();


        CreateFolder();
        insertImages();
        SendEmail();
        //Save the File to the Directory (Folder).

        string message = "Your details have been saved successfully,you will receive an email once your account has been approved";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

        //tbEmail.Text = string.Empty;
        //tbFirstName.Text = string.Empty;
        //tbLastName.Text = string.Empty;
        //tbNumber.Text = string.Empty;
        //tbCode.Text = "254";

        //lblScs.Visible = true;
    }


    private void insertImages()
    {
        getUserID1();
        getUserID2();
        getUserID3();
        getUserID4();


    }


    private void CreateFolder()
    {
        int userRegNo;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fname", textInfo.ToTitleCase(tbFirstName.Value));
            cmd.Parameters.AddWithValue("@email", tbEmail.Value);

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();
                userRegNo = Convert.ToInt32(regU);

                string folderPath = Path.Combine(Server.MapPath("~/Userimages/ProfileImages/" + userRegNo));

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(folderPath);


                }




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

    private void getUserID1()
    {
        int userRegNo;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fname", textInfo.ToTitleCase(tbFirstName.Value));
            cmd.Parameters.AddWithValue("@email", tbEmail.Value);

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();


                userRegNo = Convert.ToInt32(regU);


               

                string folderPath = Path.Combine(Server.MapPath("~/Userimages/ProfileImages/" + userRegNo));

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(folderPath);

                  
                }


                else
                {

                }

                if (FileUploadPic.PostedFile != null)


                {
                    string filename = FileUploadPic.PostedFile.FileName.ToString();

                    filename = "profileimage1.jpg";


                    string fileExt = System.IO.Path.GetExtension(FileUploadPic.FileName);

                    if (filename.Length > 96)
                    {
                        //alert image name should not exceed 96 characters
                    }



                    else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
                    {


                    }
                    else if (FileUploadPic.PostedFile.ContentLength > 10000000)
                    {


                    }

                    //save image to folder
                    else
                    {

                    



                        var photo = "/Userimages/ProfileImages/" + userRegNo + "/" + filename;
                        FileUploadPic.SaveAs(Server.MapPath("~/Userimages/ProfileImages/" + userRegNo + "/" + filename));

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQuery = "UPDATE [userinfo] SET [photo1] = @photo WHERE [userId] = @uid";
                        SqlCommand com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@photo", photo);
                        com.Parameters.AddWithValue("@uid", userRegNo);

                        com.ExecuteNonQuery();
                        conn.Close();
                      

                    }

                }

            }
            else
            {
                //Or show in messagebox usingScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Wrong Username/Password');", true);
                //Or write using Response.Write("Wrong Username/Password");
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

    protected void userReg_Click(object sender, EventArgs e)
    {
        regUSer();
    }


    private void getUserID2()
    {
        int userRegNo;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fname", textInfo.ToTitleCase(tbFirstName.Value));
            cmd.Parameters.AddWithValue("@email", tbEmail.Value);

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();


                userRegNo = Convert.ToInt32(regU);
                //Or in show messagebox using  ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Login Successfull');", true);
                //Or write using Response.Write("Login Successfull");
                //Or redirect using Response.Redirect("Mypanel.aspx");

                if (FileUpload1.PostedFile != null)


                {
                    string filename = FileUpload1.PostedFile.FileName.ToString();

                    filename = "profileimage2.jpg";


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

                      



                        var photo = "/Userimages/ProfileImages/" + userRegNo + "/" + filename;
                        FileUpload1.SaveAs(Server.MapPath("~/Userimages/ProfileImages/" + userRegNo + "/" + filename));

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQuery = "UPDATE [userinfo] SET [photo2] = @photo WHERE [userId] = @uid";
                        SqlCommand com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@photo", photo);
                        com.Parameters.AddWithValue("@uid", userRegNo);

                        com.ExecuteNonQuery();
                        conn.Close();
                       
                    }

                }

            }
            else
            {
                //Or show in messagebox usingScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Wrong Username/Password');", true);
                //Or write using Response.Write("Wrong Username/Password");
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


    private void getUserID3()
    {
        int userRegNo;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fname", textInfo.ToTitleCase(tbFirstName.Value));
            cmd.Parameters.AddWithValue("@email", tbEmail.Value);

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();


                userRegNo = Convert.ToInt32(regU);
                //Or in show messagebox using  ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Login Successfull');", true);
                //Or write using Response.Write("Login Successfull");
                //Or redirect using Response.Redirect("Mypanel.aspx");

                if (FileUpload2.PostedFile != null)


                {
                    string filename = FileUpload2.PostedFile.FileName.ToString();

                    filename = "profileimage3.jpg";


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

                      



                        var photo = "/Userimages/ProfileImages/" + userRegNo + "/" + filename;
                        FileUpload2.SaveAs(Server.MapPath("~/Userimages/ProfileImages/" + userRegNo + "/" + filename));

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQuery = "UPDATE [userinfo] SET [photo3] = @photo WHERE [userId] = @uid";
                        SqlCommand com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@photo", photo);
                        com.Parameters.AddWithValue("@uid", userRegNo);

                        com.ExecuteNonQuery();
                        conn.Close();
                       

                    }

                }

            }
            else
            {
                //Or show in messagebox usingScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Wrong Username/Password');", true);
                //Or write using Response.Write("Wrong Username/Password");
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

    private void getUserID4()
    {
        int userRegNo;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fname", textInfo.ToTitleCase(tbFirstName.Value));
            cmd.Parameters.AddWithValue("@email", tbEmail.Value);

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();


                userRegNo = Convert.ToInt32(regU);
                //Or in show messagebox using  ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Login Successfull');", true);
                //Or write using Response.Write("Login Successfull");
                //Or redirect using Response.Redirect("Mypanel.aspx");

                if (FileUpload3.PostedFile != null)


                {
                    string filename = FileUpload3.PostedFile.FileName.ToString();

                    filename = "profileimage4.jpg";


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

                  



                        var photo = "/Userimages/ProfileImages/" + userRegNo + "/" + filename;
                        FileUpload3.SaveAs(Server.MapPath("~/Userimages/ProfileImages/" + userRegNo + "/" + filename));

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQuery = "UPDATE [userinfo] SET [photo4] = @photo WHERE [userId] = @uid";
                        SqlCommand com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@photo", photo);
                        com.Parameters.AddWithValue("@uid", userRegNo);

                        com.ExecuteNonQuery();
                        conn.Close();
                       

                    }

                }

            }
            else
            {
                //Or show in messagebox usingScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Wrong Username/Password');", true);
                //Or write using Response.Write("Wrong Username/Password");
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

    private void SendEmail()
    {
        try
        {
            MailMessage mailMessage = new MailMessage();


            mailMessage.To.Add("info@dmk.co.ke");
            mailMessage.From = new MailAddress("info@dmk.co.ke", "DMK New user");
            mailMessage.Subject = "New user sign up";
            mailMessage.Body = "A new user has signed, login to verify account";
            SmtpClient smtpClient = new SmtpClient("dmk.co.ke");
            NetworkCredential Credentials = new NetworkCredential("info@dmk.co.ke", "sU7$zt21");
            smtpClient.Credentials = Credentials;
            mailMessage.Priority = MailPriority.High;
            smtpClient.Send(mailMessage);
           


        }
        catch (Exception ex)
        {
            

        }
    }

}