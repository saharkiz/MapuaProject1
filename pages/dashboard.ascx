<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dashboard.ascx.cs" Inherits="pages_dashboard" %>


 <script src="js/pages/compCharts.js"></script>


<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">iFrame Copy/Paste</h4>
      </div>
      <div class="modal-body">
        <asp:TextBox ID="txtiframe" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox><br/>
	<button type='button' onclick="location.href = 'admin.aspx?page=dashboard';">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-----new section --->
<div class="row">
    <div class="col-sm-6 col-lg-3">
        <a href="javascript:void(0)" class="widget">
            <div class="widget-content widget-content-mini text-right clearfix">
                <div class="widget-icon pull-left themed-background">
                    <i class="gi gi-cardio text-light-op"></i>
                </div>
                <h2 class="widget-heading h3">
                    <strong>+<span data-toggle="counter"><asp:Literal ID="Literal1" runat="server"></asp:Literal></span></strong>
                </h2>
                <span class="text-muted">Total Uploads</span>
            </div>
        </a>
    </div>
    <div class="col-sm-6 col-lg-3">
        <a href="javascript:void(0)" class="widget">
            <div class="widget-content widget-content-mini text-right clearfix">
                <div class="widget-icon pull-left themed-background-danger">
                    <i class="hi hi-user text-light-op"></i>
                </div>
                <h2 class="widget-heading h3 text-danger">
                    <strong>+ <span data-toggle="counter">
                        <asp:Literal ID="Literal4" runat="server"></asp:Literal></span></strong>
                </h2>
                <span class="text-muted">Total Updates</span>
            </div>
        </a>
    </div>
</div>



<div class="block">
    <div class="block-title">
        <ul class="nav nav-tabs" data-toggle="tabs">
            <li class="active"><h2> Excel Uploads</h2></li>
        </ul>
    </div>
    <!-- END Block Tabs Title -->
	
<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
        <table id="example-datatable" class="table table-striped table-bordered table-vcenter">
            <thead>
                <tr>
                    <th>Notes</th>
                    <th style="width: 50px;">Type</th>
                    <th style="width: 150px;">Created By</th>
                    <th style="width: 150px;">Created On</th>
                    <th class="text-center" style="width: 75px;"><i class="fa fa-flash"></i></th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("ExcelFile").ToString() %> - <%# Eval("Status").ToString() %></td>
            <td><%# Eval("ExcelType").ToString().ToUpper() %></td>
            <td><span class="label label-info"><%# Eval("CreatedBy") %></span></td>
            <td><%# Eval("CreatedOn", "{0:d}") %></td>
            <td class="text-center">
                <a href='admin.aspx?page=WorkFlowApproval&id=<%# Eval("id") %>' class="btn btn-effect-ripple btn-xs btn-success" OnClientClick="return confirm('Are you sure you want Approve this Item?');"><i class="gi gi-circle_ok"></i></a>
                
		<a href='/user/default.aspx?id=<%# Eval("id") %>&t=<%# Eval("ExcelFile") %>' class="btn btn-effect-ripple btn-xs btn-danger"><i class="fa fa-eye"></i></a>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-effect-ripple btn-xs btn-danger" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("ExcelFile") %>'><i class="fa fa-windows"></i></asp:LinkButton>
           </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table><br/><br/>
    </FooterTemplate>


</asp:Repeater>

<br/>
</div>


<div class="table-responsive">

                         <asp:GridView CssClass="table table-bordered table-striped no-footer" ID="Repeater2" runat="server"></asp:GridView>
</div>
<br/><br/><br/>
<div class="block row">
 <div class="form-group form-actions">
                        <div class="col-md-12">
			
                        <asp:Button runat="server" class="btn btn-effect-ripple btn-primary pull-right" id="next2"  OnClick="btnRequest_Click" Text="Clear Log" />
			<br/>
			<asp:Label ID="lblstatus" runat="server" Text="Label"></asp:Label>
<br/><br/>
                        </div>
                    </div>
</div>



