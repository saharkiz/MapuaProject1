using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class defaults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("lock.aspx?user=" + this.Context.User.Identity.Name);
        }
        try
        {
            Control c = LoadControl("~/pages/overall.ascx");
            PlaceHolder_UserControl.Controls.Add(c);
        }
        catch (Exception ex)
        {
            Response.Write("<br/><br/><br/><br/><br/><br/><br/>" + ex.ToString()); //in case widget does load.

        }
    }
}