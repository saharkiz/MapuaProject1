	using System;
	using System.Collections.Generic;
	using System.Configuration;
	using System.Data;
	using System.Data.SqlClient;
	using System.IO;
	using System.Web;
	using System.Web.UI;
	using System.Web.UI.WebControls;

	public partial class pages_dynamic : System.Web.UI.UserControl
	{
	protected void Page_Load(object sender, EventArgs e)
	{
		Page.ClientScript.RegisterStartupScript(
				GetType(),
				"MyKey",
				"$(function(){ FormsWizard.init(); });",
				true);
		if (!this.IsPostBack)
        	{
			txterror.Visible = false;
		}
	}
	protected void LinkButton3_Click(object sender, EventArgs e)
	{
		/*string filename = lstStatus.SelectedValue.ToString() + ".csv";
		var filePath = Server.MapPath("templates/" +  filename);
			Response.ContentType = "application/octet-stream";
			Response.AppendHeader("Content-Disposition","attachment; filename=" +  filename);
			Response.TransmitFile(filePath);
			Response.End();*/
	}
	protected void btnRequest_Click(object sender, EventArgs e)
	{

		HttpPostedFile file = Request.Files[0];
		String finalUrl = "";
		//check file was submitted
		if (file != null && file.ContentLength > 0)
		{
			string fname = Path.GetFileName(file.FileName);
			if (fname.Contains("dti_"))
			{
				if (fname.Contains(".csv"))
				{
						finalUrl = Server.MapPath(Path.Combine("~/App_Data/", fname));
						file.SaveAs(finalUrl);

						var lines = System.IO.File.ReadAllLines(finalUrl);

						SqlCommand cmd = new SqlCommand("sp_createTable");
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.Add("@headers", SqlDbType.VarChar).Value = lines[0];
						cmd.Parameters.Add("@table", SqlDbType.VarChar).Value = fname;
						cmd.Parameters.Add("@num", SqlDbType.VarChar).Value = lines[0].Split(',').Length.ToString();
						cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["email"].ToString();
						bool save = general.performActionNoTrans(cmd);
						if (true)
						{ 
							run(lines,fname);
						}
				}else
				{
					lblerror.Text = ".CSV File Allowed Only.";txterror.Visible = true;
				}
			}
			else{
				lblerror.Text = "File does not contain DTI_ prefix. ";txterror.Visible = true;
			}
		}
		else
		{
			lblerror.Text = "File Empty.";txterror.Visible = true;
		}
	}

	private void run(string[] lines, string tablename)
	{
		try
		{
			var columns = lines[0].Split(',');
			var table = new DataTable();
			foreach (var c in columns)
				table.Columns.Add(c);

			// Add columns
			//table.Columns.Add(new DataColumn("grouping", typeof(System.String)));
			//table.Columns.Add(new DataColumn("ID", typeof(System.String)));
			string uid = Guid.NewGuid().ToString();
			for (int i = 1; i <= lines.Length - 1; i++) //change lines.Count()
			{
				string[] array = new String[] { i.ToString() };
				string[] array2 =  lines[i].Split(',');
				var list = new List<string>();
				list.AddRange(array2);
				//list.AddRange(array);

				// ::: Call ToArray to convert List to array
				string[] array3 = list.ToArray();
				table.Rows.Add(array3);
			}

			var connection = ConfigurationManager.ConnectionStrings["AppConnection"].ToString();
			using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connection))
			{
				bulkCopy.DestinationTableName = tablename.Replace(".csv", "");
				bulkCopy.WriteToServer(table);
			}
			lblerror.Text = "Process Complete";txterror.Visible = true;
		}
		catch (Exception e)
		{
			lblerror.Text = "" + e.ToString();txterror.Visible = true;
		}
	}
	private void addEntry(string guid)
	{
		
	}
	}