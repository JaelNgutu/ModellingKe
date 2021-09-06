using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void loginUser()
    {

        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Login_Admin_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", login.Value.Trim());


            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string savedPasswordHash = dt.Rows[0][2].ToString();
                byte[] hashBytes = Convert.FromBase64String(savedPasswordHash);

                byte[] salt = new byte[16];
                Array.Copy(hashBytes, 0, salt, 0, 16);
                var pbkdf2 = new Rfc2898DeriveBytes(password.Value, salt, 10000);
                byte[] hash = pbkdf2.GetBytes(20);

                int ok = 1;
                for (int i = 0; i < 20; i++)
                    if (hashBytes[i + 16] != hash[i])
                        ok = 0;
                if (ok == 1)
                {
                    string adminID;
                    adminID = dt.Rows[0][0].ToString().Trim();



                    Session["AdminID"] = adminID;

                    Response.Redirect("~/Admin/AdminHome.aspx");





                }

                else
                {
                    LabelError.Visible = true;

                }



            }

            else
            {
                LabelError.Visible = true;
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

    protected void btlog_Click(object sender, EventArgs e)
    {
        loginUser();
    }
}