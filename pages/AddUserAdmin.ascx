<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddUserAdmin.ascx.cs" Inherits="pages_AddUserAdmin" %>




<div class="content-header">
    <div class="row">
        <div class="col-sm-6">
            <div class="header-section">
                <h1>Add System Users</h1>
            </div>
        </div>
        <div class="col-sm-6 hidden-xs">
            <div class="header-section">
                <ul class="breadcrumb breadcrumb-top">
                    <li><a href="admin.aspx?page=userAdmin">User List</a></li>
                    <li>Add System User</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="block row">
    <div class="block-title">
        <h2>Add Users</h2>
    </div>
     <div class="form-group">
            <label class="col-md-3 control-label" for="example-hf-email">Full Name<span class="text-danger">*</span></label>
            <div class="col-md-9">
                <asp:TextBox ID="txtfullname"  runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
     <div class="form-group">
            <label class="col-md-3 control-label" for="example-hf-email">Email/Username<span class="text-danger">*</span></label>
            <div class="col-md-9">
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
     <div class="form-group">
            <label class="col-md-3 control-label" for="example-hf-email">Password<span class="text-danger">*</span></label>
            <div class="col-md-9">
                <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" Text="abcd1234"></asp:TextBox>
		<span class="help-block">Default Password - Encrypted</span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label" for="example-hf-email">System Role<span class="text-danger">*</span></label>
            <div class="col-md-9">
                <asp:DropDownList ID="cmbStatus" runat="server" CssClass="select-select2" Style="width: 100%;" data-placeholder="Choose one..">
                    <asp:ListItem Selected="True" value="user">User</asp:ListItem>
                    <asp:ListItem value="admin">Administrator</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label" for="example-hf-email">Department<span class="text-danger">*</span></label>
            <div class="col-md-9">
                <asp:DropDownList ID="cmbdepartment" runat="server" CssClass="select-select2" Style="width: 100%;" data-placeholder="Choose one..">
                    <asp:ListItem Selected="True">DTI Employee</asp:ListItem>
                    <asp:ListItem>Client</asp:ListItem>
                    <asp:ListItem>RESIGNED</asp:ListItem>

                </asp:DropDownList>
            </div>
        </div>

     <div class="form-group">
            <label class="col-md-3 control-label" for="example-hf-email">Rank<span class="text-danger">*</span></label>
            <div class="col-md-9">
                <asp:TextBox ID="txtrank" runat="server" CssClass="form-control" Text="Employee"></asp:TextBox>
            </div>
        </div>
<div class="form-group">
            <div class="col-md-9">
        	<br /><br />
            </div>
        </div>
        <div class="form-group form-actions">
            <div class="col-md-9 col-md-offset-3">
                <asp:Button ID="btnRequest" runat="server" Text="Save Data" ValidationGroup="req" CssClass="btn btn-lg btn-success" OnClick="btnRequest_Click" />
                <button type="reset" class="btn btn-lg btn-effect-ripple btn-danger" style="overflow: hidden; position: relative;">Reset</button>
            </div>
        </div>

        </div>


<div id="modal-fade" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h3 class="modal-title"><strong>Request Warning</strong></h3>
</div>
<div class="modal-body">
Number of Hours not in Correct format. Please use Whole Numbers
</div>
<div class="modal-footer">
<button type="button" class="btn btn-effect-ripple btn-danger" data-dismiss="modal" style="overflow: hidden; position: relative;"><span class="btn-ripple animate" style="height: 60px; width: 60px; top: -17px; left: -4.625px;"></span>Close</button>
</div>
</div>
</div>
</div>
