<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Result.ascx.cs" Inherits="pages_Result" %>

<div class="content-header">
    <div class="row">
        <div class="col-sm-6">
            <div class="header-section">
                <h1>Search Results</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group">
            <div class="col-sm-12 push-bit">
                <h3>Term: <strong>
                    <asp:Label ID="lblSearch" runat="server" Text="Label"></asp:Label></strong></h3>
            </div>
        </div>

    </div>

</div>



<div class="block full">
    <!-- Block Tabs Title -->
    <div class="block-title">
        <div class="block-options pull-right">
        </div>
        <ul class="nav nav-tabs" data-toggle="tabs">
            <li class="active"><a href="#profile-d">Tables</a></li>
        </ul>
    </div>
    <!-- END Block Tabs Title -->

    <!-- Tabs Content -->
    <div class="tab-content">
        <!-- Activity -->
        <div class="tab-pane active" id="profile-d">
            <div class="form-horizontal form-bordered table-responsive">
<asp:Repeater ID="GridView1" runat="server">
    <HeaderTemplate>
        <table id="example-datatable" class="table table-striped table-bordered table-vcenter">
            <thead>
                <tr>
                    <th class="text-center" style="width: 155px;"><i class="fa fa-flash"></i></th>
                    <th>Indicator Results</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
		<td>
			<a href="admin.aspx?page=overall&t=<%# Eval("menu") %>" data-toggle="tooltip" title="View" class="btn btn-effect-ripple btn-xs btn-warning"><i class="hi hi-zoom-in"></i></a>
       		</td>
            <td><%# Eval("menu") %></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>


</asp:Repeater>

            </div>
        </div>

    </div>
    <!-- END Tabs Content -->
</div>

