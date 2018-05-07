using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mylock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
	if (this.Context.User.Identity.Name.Length < 2)
	{
		Response.Redirect("default.aspx");
	}
        Literal1.Text = this.Context.User.Identity.Name;
        Literal2.Text = this.Context.User.Identity.Name;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Select * from t_users where FullName=@username and [Password]=@password");
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Literal1.Text;
        cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = general.getMd5Hash(txtpassword.Text);
        DataSet ds = general.getSet(cmd);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                string id = ds.Tables[0].Rows[0]["id"].ToString();
                if (string.IsNullOrEmpty(id))
                {
                    
                }
                else {

                    Session["name"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                    Session["email"] = ds.Tables[0].Rows[0]["Email"].ToString();
                    Session["id"] = ds.Tables[0].Rows[0]["id"].ToString();
                    Session["role"] = ds.Tables[0].Rows[0]["role"].ToString();
                    Response.Redirect("/admin.aspx?page=dashboard");
                }
            }
        }
    }
}