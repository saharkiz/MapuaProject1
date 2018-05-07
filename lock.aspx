<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lock.aspx.cs" Inherits="mylock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">

    <title>Locked Out</title>

    <!-- Icons -->
    <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
    <link rel="shortcut icon" href="img/favicon.png">
    <link rel="apple-touch-icon" href="img/icon57.png" sizes="57x57">
    <link rel="apple-touch-icon" href="img/icon72.png" sizes="72x72">
    <link rel="apple-touch-icon" href="img/icon76.png" sizes="76x76">
    <link rel="apple-touch-icon" href="img/icon114.png" sizes="114x114">
    <link rel="apple-touch-icon" href="img/icon120.png" sizes="120x120">
    <link rel="apple-touch-icon" href="img/icon144.png" sizes="144x144">
    <link rel="apple-touch-icon" href="img/icon152.png" sizes="152x152">
    <link rel="apple-touch-icon" href="img/icon180.png" sizes="180x180">
    <!-- END Icons -->

    <!-- Stylesheets -->
    <!-- Bootstrap is included in its original form, unaltered -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Related styles of various icon packs and plugins -->
    <link rel="stylesheet" href="css/plugins.css">

    <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
    <link rel="stylesheet" href="css/main.css">

    <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->

    <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
    <link rel="stylesheet" href="css/themes.css">
    <!-- END Stylesheets -->

    <!-- Modernizr (browser feature detection library) -->
    <script src="js/vendor/modernizr-3.3.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Full Background -->
        <!-- For best results use an image with a resolution of 1280x1280 pixels (prefer a blurred image for smaller file size) -->
        <img src="img/placeholders/layout/lock_full_bg.jpg" alt="Full Background" class="full-bg full-bg-bottom animation-pulseSlow">
        <!-- END Full Background -->

        <!-- Login Container -->
        <div id="login-container">
            <!-- Lock Header -->
            <p class="text-center push-top-bottom animation-slideDown">
                <img src="img/placeholders/avatars/avatar6@2x.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-avatar-2x">
            </p>
            <h1 class="text-center text-light push-top-bottom animation-fadeInQuick">
                <strong>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></strong><br>
                <small><em>Locked Out</em></small>
            </h1>
            <!-- END Lock Header -->

            <!-- Lock Form -->
            <div class="form-horizontal push animation-fadeInQuick">
                <div class="form-group">
                    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2">
                        <div class="input-group input-group-lg">
                            <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1" CssClass="input-group input-group-lg">
                                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control form-control-borderless" placeholder="Enter your pass.."></asp:TextBox>
                                <div class="input-group-btn">
                                    <asp:LinkButton ID="Button1" runat="server" Text="<i class='fa fa-unlock-alt'></i>" CssClass="btn btn-effect-ripple btn-block btn-primary" OnClick="Button1_Click">  </asp:LinkButton>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
            <p class="text-center animation-fadeInQuick">
                <a href="default.aspx"><small>Not
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>?</small></a>
            </p>
            <!-- END Lock Form -->
        </div>
        <!-- END Login Container -->

        <!-- jQuery, Bootstrap, jQuery plugins and Custom JS code -->
        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>
    </form>
</body>
</html>
