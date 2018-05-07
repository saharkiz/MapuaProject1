using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
	if (Request.QueryString["action"] != null) 
	{
		switch(Request.QueryString["action"].ToString())
		{
			case "getPMI":
        SqlCommand cmd = new SqlCommand(" select [Year],[Month],Manufacturing,Retail_WholeSale,Composite_index,Services from t_pmi");
        DataSet ds = general.getSet(cmd);
        Response.Write( general.DStoJSON(ds) );
			break;


 
		}
	}
    }
}