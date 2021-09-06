using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

    }


    protected void ButtonBio_Click(object sender, EventArgs e)
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


        Response.Redirect(Request.RawUrl);
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


                var photo = "~/Userimages/PortfolioImages/" + filename;
                FileUpload1.SaveAs(Server.MapPath("~/Userimages/PortfolioImages/" + filename));

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string insertQuery = "INSERT INTO [portfolio] ([userID],[image]) VALUES  (@uid,@photo)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@uid", 6);
                com.Parameters.AddWithValue("@photo", photo);

                com.ExecuteNonQuery();
                conn.Close();
                Response.Redirect(Request.RawUrl);

            }

        }

    }


    private void changePassword()
    {
        byte[] salt;

        new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
        var pbkdf2 = new Rfc2898DeriveBytes(TextBoxNewPwd.Text, salt, 10000);

        byte[] hash = pbkdf2.GetBytes(20);
        byte[] hashBytes = new byte[36];

        Array.Copy(salt, 0, hashBytes, 0, 16);
        Array.Copy(hash, 0, hashBytes, 16, 20);

        string savedPasswordHash = Convert.ToBase64String(hashBytes);

        int UserID = Convert.ToInt32(Session["UserID"]);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "UPDATE [userInfo] SET [password] = @pwd WHERE [userID] = @uid";
        SqlCommand com = new SqlCommand(insertQuery, conn);

        com.Parameters.AddWithValue("@pwd", savedPasswordHash);
        com.Parameters.AddWithValue("@uid", UserID);

        com.ExecuteNonQuery();
        conn.Close();


        Response.Redirect(Request.RawUrl);
    }

    protected void BtnPortFolio_Click(object sender, EventArgs e)
    {
        AddPortfolio();
    }

    protected void ButtonChangePassword_Click(object sender, EventArgs e)
    {
        changePassword();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        getUserID1();


        Response.Redirect(Request.RawUrl);
    }


    private void getUserID1()
    {

        int userRegNo = Convert.ToInt32(Session["UserID"]);
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uid", userRegNo);
            ;

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();

                string fname;
                fname = dt.Rows[0][1].ToString().Trim();

                string lname;
                lname = dt.Rows[0][2].ToString().Trim();


                userRegNo = Convert.ToInt32(regU);
                //Or in show messagebox using  ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Login Successfull');", true);
                //Or write using Response.Write("Login Successfull");
                //Or redirect using Response.Redirect("Mypanel.aspx");

                if (FileUpload2.PostedFile != null)


                {
                    string filename = FileUpload2.PostedFile.FileName.ToString();

                    filename = "profileimage1.jpg";


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

                        string userName = fname + lname;



                        var photo = "/Userimages/ProfileImages/" + userName + "/" + filename;
                        FileUpload2.SaveAs(Server.MapPath("~/Userimages/ProfileImages/" + userName + "/" + filename));

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQuery = "UPDATE [userinfo] SET [photo1] = @photo WHERE [userId] = @uid";
                        SqlCommand com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@photo", photo);
                        com.Parameters.AddWithValue("@uid", userRegNo);

                        com.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect(Request.RawUrl);

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

    protected void Button5_Click(object sender, EventArgs e)
    {
        getUserID2();
    }



    private void getUserID2()
    {

        int userRegNo = Convert.ToInt32(Session["UserID"]);
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uid", userRegNo);
            ;

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();

                string fname;
                fname = dt.Rows[0][1].ToString().Trim();

                string lname;
                lname = dt.Rows[0][2].ToString().Trim();


                userRegNo = Convert.ToInt32(regU);
                //Or in show messagebox using  ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Login Successfull');", true);
                //Or write using Response.Write("Login Successfull");
                //Or redirect using Response.Redirect("Mypanel.aspx");

                if (FileUpload3.PostedFile != null)


                {
                    string filename = FileUpload3.PostedFile.FileName.ToString();

                   
                    filename = "profileimage2.jpg";


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

                        string userName = fname + lname;



                        var photo = "/Userimages/ProfileImages/" + userName + "/" + filename;
                        FileUpload3.SaveAs(Server.MapPath("~/Userimages/ProfileImages/" + userName + "/" + filename));

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQuery = "UPDATE [userinfo] SET [photo2] = @photo WHERE [userId] = @uid";
                        SqlCommand com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@photo", photo);
                        com.Parameters.AddWithValue("@uid", userRegNo);

                        com.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect(Request.RawUrl);

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

        int userRegNo = Convert.ToInt32(Session["UserID"]);
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uid", userRegNo);
            ;

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();

                string fname;
                fname = dt.Rows[0][1].ToString().Trim();

                string lname;
                lname = dt.Rows[0][2].ToString().Trim();


                userRegNo = Convert.ToInt32(regU);
                //Or in show messagebox using  ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Login Successfull');", true);
                //Or write using Response.Write("Login Successfull");
                //Or redirect using Response.Redirect("Mypanel.aspx");

                if (FileUpload4.PostedFile != null)


                {
                    string filename = FileUpload4.PostedFile.FileName.ToString();


                    filename = "profileimage3.jpg";


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

                        string userName = fname + lname;



                        var photo = "/Userimages/ProfileImages/" + userName + "/" + filename;
                        FileUpload4.SaveAs(Server.MapPath("~/Userimages/ProfileImages/" + userName + "/" + filename));

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQuery = "UPDATE [userinfo] SET [photo3] = @photo WHERE [userId] = @uid";
                        SqlCommand com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@photo", photo);
                        com.Parameters.AddWithValue("@uid", userRegNo);

                        com.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect(Request.RawUrl);

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

        int userRegNo = Convert.ToInt32(Session["UserID"]);
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("userID_Check", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uid", userRegNo);
            ;

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string regU;
                regU = dt.Rows[0][0].ToString().Trim();

                string fname;
                fname = dt.Rows[0][1].ToString().Trim();

                string lname;
                lname = dt.Rows[0][2].ToString().Trim();


                userRegNo = Convert.ToInt32(regU);
                //Or in show messagebox using  ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Login Successfull');", true);
                //Or write using Response.Write("Login Successfull");
                //Or redirect using Response.Redirect("Mypanel.aspx");

                if (FileUpload5.PostedFile != null)


                {
                    string filename = FileUpload5.PostedFile.FileName.ToString();


                    filename = "profileimage4.jpg";


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

                        string userName = fname + lname;



                        var photo = "/Userimages/ProfileImages/" + userName + "/" + filename;
                        FileUpload5.SaveAs(Server.MapPath("~/Userimages/ProfileImages/" + userName + "/" + filename));

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQuery = "UPDATE [userinfo] SET [photo4] = @photo WHERE [userId] = @uid";
                        SqlCommand com = new SqlCommand(insertQuery, conn);
                        com.Parameters.AddWithValue("@photo", photo);
                        com.Parameters.AddWithValue("@uid", userRegNo);

                        com.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect(Request.RawUrl);

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


    protected void Button6_Click(object sender, EventArgs e)
    {
        getUserID3();
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        getUserID4();
    }

    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int photoID = Convert.ToInt32(e.CommandArgument);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string deleteQuery = "DELETE FROM [portfolio] WHERE  portfolioID=@uid";
        SqlCommand com = new SqlCommand(deleteQuery, conn);

        com.Parameters.AddWithValue("@uid", photoID);

        com.ExecuteNonQuery();
        conn.Close();
        Response.Redirect(Request.RawUrl);
    }



}
