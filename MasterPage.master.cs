using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private string _user;
    public string user {
        get
        {
            return this._user;
        }
        set
        {
            this._user = value;
        }
    }
	public static string mytitle{get; set;}
    public static string newmenu { get; set; }
    public static string ss { get; set; }
    public static JArray jj { get; set; }
    public static JObject Shahryar { get; set; }
    public static string id { get; set; }


    public object MessageBox { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
			if (Request.QueryString["t"] != null)
			{
				mytitle= Request.QueryString["t"].ToString() + " Data";
			}
			else{
				mytitle=  "Department of Trade and Industry Philippines DataBank";
			}
            try
            {
                user = this.Context.User.Identity.Name;
                txtname.Text = Session["name"].ToString();
                txtemail.Text = Session["email"].ToString();
		        txtrole.Text = Session["role"].ToString();

            }
            catch (Exception)
            {
            }

	        SqlCommand cmd = new SqlCommand(@"SELECT TABLE_NAME as Menu FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='DTI' and TABLE_NAME not like '%t\_%' ESCAPE '\'");
            newmenu = general.DStoJSON(general.getSet(cmd));



            
            JArray jsonArray = JArray.Parse(json: newmenu);
            string menuu = "";
            foreach (JObject element in jsonArray)
            {
                menuu = menuu + "<li><a href=\"admin.aspx?page=overall&t=" + element.GetValue(propertyName: "Menu") + "\"><i class=\"hi hi-book sidebar-nav-icon\"></i><span class=\"sidebar-nav-mini-hide\">" + element.GetValue(propertyName: "Menu").ToString().Replace("dti_","") + "</span></a></li>";

            }
            newmenu = menuu;

            //string json = JsonConvert.SerializeObject(newmenu);


            //jj = jsonArray;
            //Shahryar = JObject.Parse(jsonArray[0]["Menu"].ToString());
            // Shahryar = JObject.Parse(newmenu);
            //JObject results = JObject.Parse();
            //shahryar = data;






            //string a = "alert(";
            //
            //string c = ");";
            //string script = a+b+c;
            //ScriptManager.RegisterStartupScript(this, GetType(),
            //                      "ServerControlScript", script, true);



        }
}

    protected void btnSaveProfile_Click(object sender, EventArgs e)
    {
	if (txtpassword.Text.Length > 0)
{
	if (txtpassword.Text == txtrepassword.Text)
	{
	    SqlCommand cmd = new SqlCommand("Update t_users set password=@pass,fullname=@name where email=@email");
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtemail.Text;
            cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value =  general.getMd5Hash(txtpassword.Text);
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtname.Text;
            bool save = general.performActionNoTrans(cmd);
            Response.Redirect("default.aspx?stat=" + save.ToString());
	}else
	{

                Page.ClientScript.RegisterStartupScript(
                                GetType(),
                                "MyKey",
                                "alert('Password/s do not match.')",
                                true);
	}
}
else
{

                Page.ClientScript.RegisterStartupScript(
                                GetType(),
                                "MyKey",
                                "alert('Password is too Short.')",
                                true);
}

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Search
        Response.Redirect("admin.aspx?page=Result&term=" + txtSearch.Text);
    }
}
