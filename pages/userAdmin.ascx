<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userAdmin.ascx.cs" Inherits="pages_userAdmin" %>

<!-- Load and execute javascript code used only in this page -->
<script src="js/pages/uiTables.js"></script>



<div class="content-header">
    <div class="row">
        <div class="col-sm-6">
            <div class="header-section">
                <h1>System Admin User</h1>
            </div>
        </div>
        <div class="col-sm-6 hidden-xs">
            <div class="header-section">
                <ul class="breadcrumb breadcrumb-top">
                    <li>User List</li>
                    <li><a href="admin.aspx?page=AddUserAdmin">Add System User</a></li>
                </ul>
            </div>
        </div>
        </div>
</div>


<div class="table-responsive">
<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
        <table id="example-datatable" class="table table-striped table-bordered table-vcenter">
            <thead>
                <tr>
                    <th class="text-center" style="width: 50px;">ID</th>
                    <th>User Full Name</th>
                    <th style="width: 50px;">Username</th>
                    <th style="width: 140px;"><i class="fa fa-users"></i>Created On</th>
                    <th class="text-center" style="width: 75px;"><i class="fa fa-flash"></i></th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td class="text-center"><%# Eval("runningNum") %></td>
            <td><span class="label label-success"><%# Eval("role") %></span> &nbsp;<%# Eval("Fullname") %></td>
            <td><span class="label label-info"><%# Eval("username") %></span></td>
            <td><%# Eval("CreatedOn", "{0:d}") %></td>
            <td class="text-center">
                <a href="admin.aspx?page=AddUserAdmin&id=<%# Eval("id") %>" data-toggle="tooltip" title="Edit" class="btn btn-effect-ripple btn-xs btn-success"><i class="fa fa-pencil"></i></a>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>


</asp:Repeater>
</div>