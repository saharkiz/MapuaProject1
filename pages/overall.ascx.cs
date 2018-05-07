using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_overall : System.Web.UI.UserControl
{
    public static string urll { get; set; }
    public static string scrr { get; set; }
    public static Array TdArray { get; set; }
    public static DataRow firstRow { get; set; }
    public static string tableDatas { get; set; }
    public static string tableC { get; set; }
    public string mytitle{get; set;}

    protected void btnFilter_Click(object sender, EventArgs e)
    {
	runTable(" where CAST(["+ lblColumnName.Text + "] as int) >= " + txtFrom.SelectedValue.ToString() + " AND CAST(["+ lblColumnName.Text + "] as int) <= " + txtTo.SelectedValue.ToString());
    }
    protected void btnRequest_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["t"].ToString().Contains("dti_"))
        {
            SqlCommand cmd = new SqlCommand("DROP TABLE " + Request.QueryString["t"].ToString());
            general.performActionNoTrans(cmd);
            lblerror.Text = "Table DELETED"; txterror.Visible = true;
        }
        else
        {
            lblerror.Text = "Not a DTI Table."; txterror.Visible = true;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            runTable("");
	    mytitle = Request.QueryString["t"].ToString().Replace("dti_","");
        }

    }

    private void runTable( string option){
            txterror.Visible = false;
            try
            {
                urll = "";
                scrr = "";

                tableDatas = "";
                tableC = "";

                string url = Request.QueryString["t"].ToString();

                SqlCommand cmd = new SqlCommand("exec('select *,'''' as [Growth] from " + url + option + "')");
                DataSet ds = general.getSet(cmd);

		lblColumnName.Text = ds.Tables[0].Columns[0].ColumnName;
                txtFrom.DataSource = ds;
                txtFrom.DataTextField = ds.Tables[0].Columns[0].ColumnName; ;
                txtFrom.DataValueField = ds.Tables[0].Columns[0].ColumnName; ;
                txtFrom.DataBind();

                txtTo.DataSource = ds;
                txtTo.DataTextField = ds.Tables[0].Columns[0].ColumnName;
                txtTo.DataValueField = ds.Tables[0].Columns[0].ColumnName;
                txtTo.DataBind();


                DataTable firstTable = ds.Tables[0];
                string[] columnNames = firstTable.Columns.Cast<DataColumn>()
                                         .Select(x => x.ColumnName)
                                         .ToArray();



                txtGrow.DataSource = columnNames;
                txtGrow.DataBind();

                for (int i = 0; i < columnNames.Length; i++)
                {
                    scrr = scrr + " <th style=\"width: 50px;\"  >" + columnNames[i] + " " + "<label class=\"csscheckbox csscheckbox-danger\"><input type=\"checkbox\" class=\"headColumn\" value=\"" + i + "\"></input><span></span></label></th>";
                }
                foreach (DataRow row in firstTable.Rows)
                {
                    foreach (DataColumn column in firstTable.Columns)
                    {
                        tableC = tableC + "<td>" + row[column] + "</td>";
                    }

                    tableDatas = tableDatas + "<tr>" + tableC + "</tr>";
                    tableC = "";


                }
                Page.ClientScript.RegisterStartupScript(
                                GetType(),
                                "MyKey",
                                "$(function(){ UiTables.init();$('#btnStat').click(); });",
                                true);


                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {

                    }
                }
                urll = scrr;

                SqlCommand cmd2 = new SqlCommand("select top 4 *,'' as [Growth] from " + url);
                Repeater1.DataSource = general.getSet(cmd2);
                Repeater1.DataBind();
            }
            catch (Exception) { }
        }
}

// query string name of table in db
