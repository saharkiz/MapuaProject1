using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_userAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            getAllData();
        }
    }
    private void getAllData()
    {
        SqlCommand cmd = new SqlCommand("select * from t_users where department <> 'RESIGNED' OR ROLE <> 'RESIGNED' order by createdOn desc");
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
                "$(function(){ UiTables.init(); });",
                true);
            }
        }
    }
}