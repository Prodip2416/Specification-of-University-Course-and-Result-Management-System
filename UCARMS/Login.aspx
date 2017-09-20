<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UCRMS.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UCARMS</title>

    <!-- Bootstrap Core CSS -->
    <link href="CSS/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="CSS/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="CSS/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="CSS/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" runat="server">
                            <fieldset>
                                <div class="form-group">     
                                    <asp:TextBox ID="txtEmail"  class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPassword" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->

                                <asp:Button ID="Button1" class="btn btn-lg btn-success btn-block"
                                            runat="server" Text="Login" OnClick="Button1_Click"/>
                                <br/><br/>
                                <asp:Label ID="lblmessage" runat="server"></asp:Label>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery -->
    <script src="Script/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Script/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="Script/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="Script/sb-admin-2.js"></script>

</body>

</html>

