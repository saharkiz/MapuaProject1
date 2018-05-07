using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //sign out from form authentication
        FormsAuthentication.SignOut();
        //abandon session
        Session.Abandon();
        Response.Redirect("default.aspx");
    }
}