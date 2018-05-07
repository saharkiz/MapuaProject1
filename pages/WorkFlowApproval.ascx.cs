using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_WorkFlowApproval : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        	{
			txterror.Visible = false;
		}
        if (Request.QueryString["id"] != null)
        {
            loadContent();
        }
        Page.ClientScript.RegisterStartupScript(
                GetType(),
                "MyKey",
                "$(function(){ FormsWizard.init(); });",
                true);
    }
    private void loadContent()
    {
        SqlCommand cmd = new SqlCommand("Select * from t_ExcelUploads where id=@id");
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        DataSet ds = general.getSet(cmd);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                lblcreatedby.Text = dr["CreatedBy"].ToString();
                lbldate.Text = dr["CreatedOn"].ToString();
                lbltype.Text = dr["ExcelType"].ToString();
                lblnote.Text = dr["notes"].ToString();
                loadData();
            }
        }

    }
    private void loadData()
    {

    }    
	protected void btnRequest_Click(object sender, EventArgs e)
    	{
	SqlCommand cmd = new SqlCommand("sp_process_approval");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Request.QueryString["id"].ToString();
        cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = lbltype.Text;
        cmd.Parameters.Add("@notes", SqlDbType.VarChar).Value = txtnotes.Text;
        cmd.Parameters.Add("@by", SqlDbType.VarChar).Value = Session["email"].ToString();
	String save = general.performActionNoTrans(cmd).ToString();
	lblerror.Text = "Operation Complete";txterror.Visible = true;
	}


}