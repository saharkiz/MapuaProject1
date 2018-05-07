using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_profile : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Literal1.Text = Session["name"].ToString();
        Literal2.Text = Session["email"].ToString();
    }
}