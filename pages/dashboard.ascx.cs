using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;
public partial class pages_dashboard : System.Web.UI.UserControl
{
        protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
		getAll();
		lblstatus.Text = File.ReadAllText(Server.MapPath("log/log.txt")).ToString().Replace("\n","<br/>");
        }
    }

	protected void btnRequest_Click(object sender, EventArgs e)
	{
		File.WriteAllText(Server.MapPath("log/log.txt").ToString(),"Log File \n _________________________________");
		Response.Redirect("admin.aspx?page=dashboard");
	}
protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string runningNum = btn.CommandArgument;
        txtiframe.Text = "<iframe src='/user/default.aspx?t=" + runningNum + "'></iframe>";
	
                Page.ClientScript.RegisterStartupScript(
                        GetType(),
                        "MyKey",
                        "$('#loginModal').modal({keyboard: false,backdrop: 'static'}); $('#loginModal').modal('show');",
                        true);
    }

    private void getAll()
    {
        SqlCommand cmd = new SqlCommand("select * from t_ExcelUploads order by CreatedOn desc");
        DataSet ds = general.getSet(cmd);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                Page.ClientScript.RegisterStartupScript(
                GetType(),
                "MyKey",
                "$(function(){ $('#example-datatable').dataTable({}); });",
                true);
		Literal1.Text = ds.Tables[0].Rows.Count.ToString();
            }
        }
    }
}