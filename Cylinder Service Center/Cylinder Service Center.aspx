<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cylinder Service Center.aspx.cs" Inherits="Cylinder_Service_Center.Cylinder_Service_Center" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cylinder Service Center</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Helvetica Neue', Arial, sans-serif;
        }

        .navbar {
            margin-bottom: 20px;
            background-color: #343a40;
            padding: 15px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand, .nav-link {
            color: #ffffff !important;
        }

            .nav-link:hover {
                color: #007bff !important;
                text-decoration: underline;
            }

        .header-title {
            font-style: italic;
            font-weight: bold;
            color: #007bff;
            text-shadow: 2px 2px 4px #aaa;
        }

        .main-image {
            width: 100%;
            height: auto;
            border-radius: 15px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .welcome-message {
            margin: 20px 0;
            font-weight: bold;
            color: #555;
            text-align: center;
            font-size: 1.2em;
        }

        .panel-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            gap: 30px;
            flex-wrap: wrap;
        }

        .panel {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 30px;
            background: linear-gradient(145deg, #ffffff, #f4f6f9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            flex: 1;
            max-width: 400px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

            .panel:hover {
                transform: scale(1.05);
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            }

            .panel h4 {
                margin-bottom: 20px;
                color: #007bff;
                border-bottom: 2px solid #007bff;
                padding-bottom: 10px;
            }

        .form-group label {
            font-weight: bold;
            color: #555;
        }

        .btn-primary, .btn-success {
            width: 100%;
            margin-top: 10px;
        }

        footer {
            margin-top: 30px;
            padding: 15px 0;
            background-color: #343a40;
            color: white;
            text-align: center;
            border-top: 4px solid #007bff;
        }

        .auto-style1 {
            border-radius: 15px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .about {
            margin-top: 30px;
            /*padding: 15px 0;*/
            background-color: silver;
            color: black;
            text-align: center;
            border-top: 4px solid #007bff;
            border-bottom: 4px solid #007bff;
            border-radius: 20px;
        }

            .about li {
                list-style-type: circle;
            }

        hr {
            /*border-top:10px solid blue;*/
            /*border-top:10px dashed blue;*/
            border-top: 10px dotted blue;
            /*border-top:10px double blue;*/
            width: 70%;
        }

        div.about {
            background-color: silver;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="#">Cylinder Service Center</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <asp:LinkButton ID="Loginlinkbtn" runat="server" CssClass="nav-link" OnClick="Loginlinkbtn_Click">
                    <i class="fas fa-sign-in-alt"></i> Sign-In
                    </asp:LinkButton>
                    <asp:LinkButton ID="Signlinkbtn" runat="server" CssClass="nav-link" OnClick="Signlinkbtn_Click">
                    <i class="fas fa-user-plus"></i> New Account
                    </asp:LinkButton>
                    <asp:LinkButton ID="Homelinkbtn" runat="server" CssClass="nav-link" OnClick="Homelinkbtn_Click">
                    <i class="fas fa-home"></i> Home
                    </asp:LinkButton>
                    <asp:LinkButton ID="Detaillinkbtn" runat="server" CssClass="nav-link">
                    <i class="fas fa-info-circle"></i> Details
                    </asp:LinkButton>
                    <asp:LinkButton ID="Helplinkbtn" runat="server" CssClass="nav-link">
                    <i class="fas fa-question-circle"></i> Help
                    </asp:LinkButton>
                    <asp:LinkButton ID="Aboutlinkbtn" runat="server" CssClass="nav-link">
                    <i class="fas fa-info"></i> About
                    </asp:LinkButton>
                    <asp:LinkButton ID="Featurelinkbtn" runat="server" CssClass="nav-link">
                    <i class="fas fa-star"></i> Features
                    </asp:LinkButton>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h2 class="header-title">Cylinder Service Center</h2>
                </div>
                <div class="col-md-4 text-center">
                    <asp:Image ID="Image2" runat="server" CssClass="main-image" ImageUrl="~/Models/Modi Cylinder.jpeg" Width="200px" Height="150px" />
                </div>
            </div>
            <asp:Image ID="Image1" runat="server" CssClass="auto-style1" ImageUrl="~/Models/Cover_photo_jpg.jpg" Width="1100px" Height="250px" />
            <p class="welcome-message">
                Welcome! You can buy cylinders or you can sell your cylinder from here! THE SMART CYLINDER FOR A SMART KITCHEN
            </p>
            <div class="panel-container">
                <asp:Panel ID="SignInPannel" runat="server" CssClass="panel">
                    <h4><i class="fas fa-sign-in-alt"></i>Sign-In</h4>
                    <div class="form-group">
                        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email-ID"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSignIn" runat="server" Text="Sign-In" CssClass="btn btn-primary" OnClick="btnSignIn_Click" />
                    <asp:Label ID="lblSignpannel" runat="server"></asp:Label>
                </asp:Panel>

                <asp:Panel ID="NewAccountPannel" runat="server" CssClass="panel">
                    <h4><i class="fas fa-user-plus"></i>New Account</h4>
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail1" runat="server" Text="Email-ID"></asp:Label>
                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblMobile" runat="server" Text="Mobile No"></asp:Label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPassword1" runat="server" Text="New Password"></asp:Label>
                        <asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblCPassword" runat="server" Text="Confirm Password"></asp:Label>
                        <asp:TextBox ID="txtCPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnNewAccount" runat="server" Text="Login" CssClass="btn btn-success" OnClick="btnNewAccount_Click" />
                    <asp:Label ID="lblNewAccountPannel" runat="server"></asp:Label>
                </asp:Panel>
            </div>
            <div class="about">

                <b>Our in house capability includes:</b>
                <li>Milling</li>
                <li>CNC Milling</li>
                <li>Turning</li>
                <li>In House Coded Welding</li>
                <li>Boring & Honing</li>
                <li>Paint Facilities</li>
                <li>Fitting & Testing</li>

                <p>For More Information Please Call <a href="tel:07700027074">+91 7700027074</a></p>
            </div>
            <div border-radius="20%">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Models/images (1).jpeg" />
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Models/download.jpeg" />
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Models/images.jpeg" Width="320px" Height="225px" />
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Models/DCA_9465-1024x682.jpg" Width="325px" Height="225px" />
            </div>
            <br />
            <hr />
            <div>
                <p class="welcome-message">
                    We are actively committed to skills development and cross training to support the customer experience,
                    coupled with a highly skilled manufacturing team adept at working with precision machinery,
                    we guaranteed consistent, high quality services to all of our customers.
                </p>
                <br />
                <p class="welcome-message">
                    <i>Our design and engineering capabilities allow us to effectively reverse engineer any product with unparalleled precision and also provide cutting edge design
                    and manufacture of bespoke new products.</i>
                </p>
                <br />
                <br />
                <u class="welcome-message"><i>Bespoke sealing, metallic components, rod coatings, external coating, fabrication, pipework and much more is part of our hydraulic portfolio.</i></u>
            </div>
            <hr />
            <div>
                <asp:Image ID="Image7" runat="server" ImageUrl="~/Models/images (2).jpeg" Width="450px" Height="250px" />
                <asp:Image ID="Image8" runat="server" ImageUrl="~/Models/download (1).jpeg" Width="650px" Height="250px" />
            </div>
        </div>

        <footer>
            &copy; 2024 Sahil Gupta
        </footer>
    </form>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

</body>
</html>
