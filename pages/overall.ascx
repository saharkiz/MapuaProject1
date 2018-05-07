<%@ Control Language="C#" AutoEventWireup="true" CodeFile="overall.ascx.cs" Inherits="pages_overall" %>
<style>
.btn-box-tool .fa-minus,
.btn-box-tool.collapsed .fa-plus {
    display: inline-block;
}
.btn-box-tool.collapsed .fa-minus,
.btn-box-tool .fa-plus {
    display: none;
}
</style>
<div style="display:none"><asp:Label ID="lblColumnName" runat="server" Text=""></asp:Label></div>
<div class="row"  runat="server" id="txterror">
   <div class="col-sm-12 col-lg-12">
      <div class="alert alert-info alert-dismissable">
         <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
         <h4><strong>Operation:</strong></h4>
         <p>
            <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
         </p>
      </div>
   </div>
</div>
<div id="page-content">
<!-- Wizard Header -->
<div class="content-header">
   <div class="row">
      <div class="col-sm-6">
         <div class="header-section">
            <h1><%= mytitle %></h1>
         </div>
      </div><div class="pull-right">

<% if (Session["role"].ToString() != "user") { %>
<asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-effect-ripple btn-danger" OnClientClick="return confirm('This Operation cannot be undone. Please Confirm?');" OnClick="btnRequest_Click"><i class="fa fa-times"></i> Delete Table</asp:LinkButton>
<% } %>
      </div>
      <div class="col-sm-6 hidden-xs">
         <div class="header-section">
         </div>
      </div>
   </div>
</div>
<div class="block row">
<div class="block-title">
         <h2>Options</h2>
         <div class="box-tools pull-right">
            <!-- Remove Button -->
            <button type="button" class="btn btn-box-tool"  id="btndemo2" data-toggle="collapse" data-target="#demo0">
				<span class="fa fa-plus"></span>
				<span class="fa fa-minus"></span>
            </button>
         </div>
      </div>
<div id="demo0" class="in">
<div class="col-sm-3 table-bordered" style="border-color:#000;min-height:280px">
   <a href="javascript:void(0)" class="widget">
      <div class="widget-content themed-background-info text-light-op">
        <strong>Range Filter Options</strong>
      </div>
      <div class="widget-content themed-background-muted text-center">
                <asp:DropDownList ID="txtFrom" runat="server" AppendDataBoundItems="true"  CssClass="select-select2" Style="width: 100%;" data-placeholder="Choose one..">
                <asp:ListItem Selected="True" Value="0">Choose...</asp:ListItem>
		</asp:DropDownList>

		<asp:DropDownList ID="txtTo" runat="server" AppendDataBoundItems="true"  CssClass="select-select2" Style="width: 100%;" data-placeholder="Choose one..">
                <asp:ListItem Selected="True" Value="0">Choose...</asp:ListItem>
		</asp:DropDownList>

	 
      </div>
	<div class="widget-content text-center">
         <h3 class="widget-heading text-dark">
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-effect-ripple btn-default" OnClick="btnFilter_Click"><i class="fa fa-filter"></i> Filter Table</asp:LinkButton>
        </h3>
      </div>
   </a>
</div>
<div class="col-sm-3 table-bordered" style="border-color:#000;min-height:280px">
   <a href="javascript:void(0)" class="widget">
      <div class="widget-content themed-background-amethyst text-light-op">
          <strong>Statistics Options</strong>
      </div>
		<div class="widget-content themed-background-muted text-center">
                <asp:DropDownList ID="txtGrow" ClientIDMode="Static" runat="server" AppendDataBoundItems="true"  CssClass="select-select2" Style="width: 100%;" data-placeholder="Choose a Column Name...">
                <asp:ListItem Selected="True" Value="0">Choose a Column Name</asp:ListItem>
		</asp:DropDownList>
		
      </div>
	<div class="widget-content text-center">
         <h3 class="widget-heading text-dark">
            <button type="button" id="btnGrowth" onclick="growth()" class="btn btn-effect-ripple btn-success"><i class="fa fa-line-chart"></i>&nbsp; Calculate Growth</button>
      	 <br/><button type="button" id="btnStat" onclick="sumOfcolumn()" class="btn btn-effect-ripple btn-success"><i class="fa fa-line-chart"></i>&nbsp; Recalculate Statistics</button>
        </h3>
      </div>
	 
   </a>
</div>
<div class="col-sm-3 table-bordered" style="border-color:#000;min-height:280px">
   <a href="javascript:void(0)" class="widget">
      <div class="widget-content themed-background-danger text-light-op">
         <strong>Chart Options</strong>
      </div>
      <div class="widget-content themed-background-muted text-center">
         <select id="charttype" class="select-select2" style="width:100%">
            <option value="bar" disabled="disabled" selected="selected">Please select a Chart Type</option>
            <option value="bar">Bar Chart</option>
            <option value="line">Line Chart</option>
         </select>
      </div>
      <div class="widget-content text-center">
         <h3 class="widget-heading text-dark">
            <button type="button" class="btn btn-effect-ripple btn-danger" onclick="checkss()"><i class="gi gi-charts"></i> &nbsp; Generate Graph</button>
		
         </h3>
      </div>
   </a>
</div>
<div class="col-sm-3 table-bordered" style="border-color:#000;min-height:280px">
   <a href="javascript:void(0)" class="widget">
      <div class="widget-content themed-background-info text-light-op">
         <strong>Download Options</strong>
      </div>
      <div class="widget-content themed-background-muted text-center">
         <select id="downloadtype" class="select-select2"  style="width:100%">
            <option value="" disabled="disabled" selected="selected">Please select a File Format Type</option>
            <option value="copy">Copy</option>
            <option value="csv">CSV</option>
            <option value="excel">Excel</option>
            <option value="pdf">PDF</option>
            <option value="print">Print</option>
         </select>
      </div>
      <div class="widget-content text-center">
         <h3 class="widget-heading text-dark">
            <button type="button" class="btn btn-effect-ripple btn-info" id="btnDownload"><i class="fa fa-download"></i> &nbsp; Download</button>
	
         </h3>
      </div>
   </a>
</div>
</div>

</div>

<div class="block row">
   <div class="col-sm-12 col-lg-12">
      <div class="justify-content-sm-center">
         <div class="block-title">
            <h2>Table</h2><button type="button" onClick="window.location.reload()" class="btn btn-effect-ripple btn-warning"><i class="fa fa-binoculars"></i>&nbsp; Reset Table</button>
         
            <div class="box-tools pull-right">
               <!-- Remove Button -->
               <button type="button" class="btn btn-box-tool" id="btndemo" data-toggle="collapse" data-target="#demo">
               <span class="fa fa-plus"></span>
				<span class="fa fa-minus"></span>
               </button>
            </div>
         </div>
         <div class="col-lg-12  table-responsive in" style="background:white"  id="demo">
            <table id="example-datatable" class="table table-striped table-bordered table-vcenter" >
               <thead>
                  <tr>
                     <%= urll %>
                  </tr>
               </thead>
               <tbody>
                  <%= tableDatas %> 
               </tbody>
            </table>
         </div>
      </div>
   </div>
</div>
<div class="block row">
   <div class="col-sm-12 col-lg-12">
      <div class="block-title">
         <h2>Statistics</h2>
         <div class="box-tools pull-right">
            <!-- Remove Button -->
            <button type="button" class="btn btn-box-tool"  id="btndemo2" data-toggle="collapse" data-target="#demo2">
           <span class="fa fa-plus"></span>
				<span class="fa fa-minus"></span>
            </button>
         </div>
      </div>
      <div class="table-responsive in" id="demo2">
         <asp:GridView ID="Repeater1" ClientIDMode="Inherit" runat="server" CssClass="table table-striped table-bordered table-vcenter"></asp:GridView>
      </div>
   </div>
  </div>
   <div class="block row">
         <div class="col-sm-12 col-lg-12">
            <div class="block-title">
               <h2>Charts</h2>
               <div class="box-tools pull-right">
                  <!-- Remove Button -->
                  <button type="button" class="btn btn-box-tool" id="btndemo3" data-widget="remove"  data-toggle="collapse" data-target="#demo3">
                  <span class="fa fa-plus"></span>
				<span class="fa fa-minus"></span>
                  </button>
               </div>
               
            </div>
	<div class="in" id="demo3">
        <canvas id="mychart" ></canvas> 
	</div>
		 </div>
   </div>


</div>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
      <script src="js/new.js?ver=75"></script>