<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="Admin_AddAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Model</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Top modelling agency kenya" />
	<meta name="keywords" content="Model,Kenyan Models,Digital Models Kenya" />
	<meta name="author" content="Jael Ngutu" />

	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet"/>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/css/animate.css"/>
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/css/icomoon.css"/>
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/css/bootstrap.css"/>

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/css/magnific-popup.css"/>

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="/css/owl.theme.default.min.css"/>
<link href="../css/style.css" rel="stylesheet" />
	<!-- Theme style  -->
	

	<!-- Modernizr JS -->
	<script src="/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
     <form id="form1" runat="server">
    <div>
    
        	<nav class="fh5co-nav" role="navigation">
       
		<div class="top-menu">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<div id="fh5co-logo"><a href="/Admin/AdminHome.aspx">Model:Admin<span>.</span></a></div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
          
						
							
                        <li class="btn-cta-login" runat="server" id="logoutbtn" ><asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-cta-login" CausesValidation="false" OnClick="LinkButton1_Click" ><i class="icon-lock-open"></i>Logout</asp:LinkButton></li>                   
						
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</nav>
        
  
      <!--- Sign in start  -->
        <div class="container" style="padding:5em" >
            <div class="form-horizontal">
                <h2>Create New Admin</h2>
                <hr />

               

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Email"></asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox ID="Email" CssClass="form-control" runat="server" placeholder="enter email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="Email"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Password"></asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox ID="password" CssClass="form-control" runat="server"  TextMode="Password" placeholder="create password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger"  runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="password"></asp:RequiredFieldValidator>
                    </div>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Repeat Username"></asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox ID="Ruser" CssClass="form-control" TextMode="Password" runat="server" MaxLength="100" placeholder="repeat password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Confirm Password!" ControlToValidate="Ruser"></asp:RequiredFieldValidator>
                           <div class="col-md-9">
                               <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="text-danger" ErrorMessage="password doesnt match"   ControlToValidate="Ruser" ControlToCompare="password"></asp:CompareValidator>
                                
                   </div>
                                </div>
                </div>
             
                 <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="Button1" runat="server" Text="Create Admin" CssClass="btn btn-default" OnClick="Button1_Click"  />
                    
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                </div>
            </div>
        </div>
        <!--- Sign in end  -->

     

    </div>
    </form>
</body>
</html>
