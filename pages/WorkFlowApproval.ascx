<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WorkFlowApproval.ascx.cs" Inherits="pages_WorkFlowApproval" %>
<script src="js/pages/formsWizard.js"></script>

<script src="js/pages/uiTables.js"></script>

<div id="page-content">
    <!-- Wizard Header -->
    <div class="content-header">
        <div class="row">
            <div class="col-sm-6">
                <div class="header-section">
                    <h1>Approval Workflow Wizard</h1>
                </div>
            </div>
            <div class="col-sm-6 hidden-xs">
                <div class="header-section">
                    <ul class="breadcrumb breadcrumb-top">
                        <li>DTI Databank</li>
                        <li>Approval Workflow Wizard</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- END Wizard Header -->

    <div class="row">
        <div class="">
<div class="row"  runat="server" id="txterror">
<div class="col-sm-12 col-lg-12">
<div class="alert alert-info alert-dismissable">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
<h4><strong>Operation:</strong></h4>
<p>
<asp:Label ID="lblerror" runat="server" Text=""></asp:Label></p>
</div>
</div>
</div>
            <!-- Progress Bar Wizard Block -->
            <div class="block row">

                <!-- Progress Wizard Content -->
                <div id="progress-wizard" class="form-horizontal form-bordered">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="progress progress-mini remove-margin">
                                <div id="progress-bar-wizard" class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0"></div>
                            </div>
                        </div>
                    </div>
                    <!-- END Progress Bar -->

                    <!-- First Step -->
                    <div id="progress-first" class="step">
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="example-progress-firstname">Uploaded By</label>
                            <div class="col-md-6">
                                <asp:Label ID="lblcreatedby" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="example-progress-firstname">Uploaded Date</label>
                            <div class="col-md-6">
                                <asp:Label ID="lbldate" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="example-progress-email">Excel Type</label>
                            <div class="col-md-6">
                                <asp:Label ID="lbltype" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="example-progress-firstname">Notes</label>
                            <div class="col-md-6">
                                <asp:Label ID="lblnote" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <!-- END First Step -->

                   
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="example-hf-email">By Accepting the Upload, the Content will be published</label>
                            <div class="col-md-6">

                                <label class="switch switch-success">
                                    <input type="checkbox" id="chk" runat="server" checked=""><span></span></label>
                            </div>
                        </div>
			<div class="form-group">
            <label class="col-md-3 control-label" for="example-hf-email">Notes<span class="text-danger">*</span></label>
            <div class="col-md-9">
                <asp:TextBox ID="txtnotes" runat="server" CssClass="form-control"></asp:TextBox>
		<span class="help-block">Cite notes/Rejection/Approval</span>
            </div>
        </div>

                        <div class="form-group form-actions">
                            <div class="col-md-6 control-label">
                                <asp:LinkButton ID="btnRequest" runat="server" Text="Confirm and Publish" CssClass="btn btn-lg btn-success" OnClick="btnRequest_Click"></asp:LinkButton>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />

                            </div>
                        </div>

                    <!-- Form Buttons -->
                    <!-- END Form Buttons -->
                </div>
                <!-- END Progress Bar Wizard Content -->
            </div>
            <!-- END Progress Bar Wizard Block -->



        </div>
    </div>

</div>
