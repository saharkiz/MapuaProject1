using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Result : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblSearch.Text = Request.QueryString["term"].ToString();
            if (!this.IsPostBack)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.Add("@term",SqlDbType.VarChar).Value = Request.QueryString["term"].ToString();

                cmd.CommandText = @"SELECT TABLE_NAME as [menu] FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='DTI' and TABLE_NAME like '%'+@term+'%'";
                GridView1.DataSource = general.getSet(cmd);
                GridView1.DataBind();

            }
        }
        catch (Exception)
        {
        }
    }
}