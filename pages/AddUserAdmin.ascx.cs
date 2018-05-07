using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_AddUserAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
           if (Request.QueryString["id"] != null)
		{
			loadUser();
		}
        }
    }
    private void loadUser(){
	SqlCommand cmd = new SqlCommand("select * from t_users where id=@id");
	cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
	DataSet ds = general.getSet(cmd);
	txtfullname.Text = ds.Tables[0].Rows[0]["fullname"].ToString();
	txtemail.Text = ds.Tables[0].Rows[0]["username"].ToString();
	txtrank.Text = ds.Tables[0].Rows[0]["rank"].ToString();
	txtpassword.Text = ds.Tables[0].Rows[0]["password"].ToString();
	cmbStatus.SelectedIndex = cmbStatus.Items.IndexOf(cmbStatus.Items.FindByValue(ds.Tables[0].Rows[0]["role"].ToString()));
	cmbdepartment.SelectedIndex = cmbdepartment.Items.IndexOf(cmbdepartment.Items.FindByValue(ds.Tables[0].Rows[0]["Department"].ToString()));
    }
    protected void btnRequest_Click(object sender, EventArgs e)
    {
	try
        {
            SqlCommand cmd;
            if (Request.QueryString["id"] == null)
            {
                cmd = new SqlCommand("INSERT INTO t_users(CreatedOn,Createdby,password,username,email,rank,role,department,fullname) VALUES (GETDATE(),@by,@pass,@email,@email,@rank,@status,@dep,@name)");

            }
            else
            {
                cmd = new SqlCommand("UPDATE t_users set password=@pass,username=@email, email=@email,rank=@rank,role=@status,department=@dep,fullname=@name, UpdatedOn=GETDATE(), UpdatedBy=@by where id=@id");
                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
            }

            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtfullname.Text;
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtemail.Text;
            cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value =  general.getMd5Hash(txtpassword.Text);
            cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = cmbStatus.SelectedValue.ToString();
            cmd.Parameters.Add("@dep", SqlDbType.VarChar).Value = cmbdepartment.SelectedValue.ToString();
            cmd.Parameters.Add("@rank", SqlDbType.VarChar).Value = txtrank.Text;
            cmd.Parameters.Add("@by", SqlDbType.VarChar).Value = Session["email"].ToString();
            bool save = general.performActionNoTrans(cmd);
            Response.Redirect("admin.aspx?page=userAdmin&stat=" + save.ToString());
        }
        catch (Exception)
        {

            Page.ClientScript.RegisterStartupScript(
                GetType(),
                "MyKey",
                "$(\"#modal-fade\").modal(\"show\")",
                true);
        }

    }
}















