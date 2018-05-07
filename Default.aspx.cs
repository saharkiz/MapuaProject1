using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            //hide error messages
            txterror2.Visible = false;
            if (Request.QueryString["reason"] != null)
            {
                txterror.Visible = true;
            }
            else
            {
                txterror.Visible = false;
            }
        }
        else
        {

        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //abcd1234  :   e19d5cd5af0378da05f63f891c7467af
        // Three valid username/password pairs:
        string[] users = { "aresh", "admin" };
        string[] passwords = { "aresh", "passw@#$!123sdford" };
        for (int i = 0; i < users.Length; i++)
        {
            bool validUsername = (string.Compare(loginemail.Text, users[i], true) == 0);
            bool validPassword = (string.Compare(loginpassword.Text, passwords[i], false) == 0);
            if (validUsername && validPassword)
            {

                Session["name"] = loginemail.Text;
                Session["email"] = "s.aresh@yahoo.com";
                Session["id"] = "";
                Session["role"] = "manager";
                CreateTicket(Session["name"].ToString());
            }
        }
        if (CheckDB(loginemail.Text, loginpassword.Text))
        {
            CreateTicket(Session["name"].ToString());
        }
        txterror2.Visible = true;
        txterror.Visible = false;
    }
    private void CreateTicket(string name)
    {
        bool isPersistent = false; //Persist.Checked; 
                                   //write down u r own methods for authentication
                                   //either from database or file

        FormsAuthenticationTicket ticket = new
        FormsAuthenticationTicket(
                1,
                name,
                System.DateTime.Now,
                System.DateTime.Now.AddMinutes(30),
                isPersistent,
                loginemail.Text, //change to ROLL
                FormsAuthentication.FormsCookiePath);
        // Encrypt the ticket.
        string encTicket = FormsAuthentication.Encrypt(ticket);
        // Create the cookie.
        Response.Cookies.Add(new
    HttpCookie(FormsAuthentication.FormsCookieName, encTicket));
        // Redirect back to original URL.

        //Response.Redirect(FormsAuthentication.GetRedirectUrl(UserName.Text, isPersistent));
        Response.Redirect("/admin.aspx?page=dashboard");
    }

    public bool CheckDB(String username, string password)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("sp_login_sys");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
            cmd.Parameters.Add("@password", SqlDbType.VarChar).Value =  general.getMd5Hash(password);
            cmd.Parameters.Add("@app", SqlDbType.VarChar).Value = "DTI";
            DataSet ds = general.getSet(cmd);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string id = ds.Tables[0].Rows[0]["id"].ToString();
                    if (string.IsNullOrEmpty(id))
                    {
                        return false;
                    }
                    else {

                        Session["name"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                        Session["email"] = ds.Tables[0].Rows[0]["Email"].ToString();
                        Session["id"] = ds.Tables[0].Rows[0]["id"].ToString();
                        Session["role"] = ds.Tables[0].Rows[0]["Role"].ToString();
                        return true;
                    }
                }
                else return false;
            }
            else return false;
        }
        catch (Exception)
        {

            return false;
        }
    }
}