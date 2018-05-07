<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dynamic.ascx.cs" Inherits="pages_dynamic" %>
<script src="js/pages/formsWizard.js"></script>
<div id="page-content">
    <!-- Wizard Header -->
    <div class="content-header">
        <div class="row">
            <div class="col-sm-6">
                <div class="header-section">
                    <h1>Dynamic Upload</h1>
                </div>
            </div>
            <div class="col-sm-6 hidden-xs">
                <div class="header-section">
                    <ul class="breadcrumb breadcrumb-top">
                    <li>DTI Databank</li>
                    <li>Dynamic Upload</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- END Wizard Header -->
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

    <div class="row">
        <div class="">

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
                            Notes *: <br/> Upload a .CSV File <br/> Ensure the .CSV File name contains "dti_"
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="example-progress-username">CSV File To Upload</label>
                            <div class="col-md-6">
                                <input type="file" id="exampleInputFile" name="exampleInputFile"  runat="server">
                            </div>
                        </div>
			
                    </div>
                    <!-- END First Step -->
                    <!-- Form Buttons -->
                    <div class="form-group form-actions">
                        <div class="col-md-8 col-md-offset-4">
			
                        <asp:Button runat="server" class="btn btn-effect-ripple btn-primary" id="next2"  OnClick="btnRequest_Click" Text="Send for Approval" />
                        </div>
                    </div>
                    <!-- END Form Buttons -->
                </div>
                <!-- END Progress Bar Wizard Content -->
            </div>
            <!-- END Progress Bar Wizard Block -->



        </div>
    </div>

</div>
