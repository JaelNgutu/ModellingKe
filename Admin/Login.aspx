<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Model</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="freehtml5.co" />



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
    <link href="/css/login.css" rel="stylesheet" />
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/css/magnific-popup.css"/>

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="/css/owl.theme.default.min.css"/>

	<!-- Theme style  -->
	<link rel="stylesheet" href="/css/style.css"/>


	<!-- Modernizr JS -->
	<script src="/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
    <form runat="server">

        <nav class="fh5co-nav" role="navigation">
       
		<div class="top-menu">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<div id="fh5co-logo"><a href="#">DigitalModelsKenya<span>.</span></a></div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
          
						
							
							
                      						
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</nav>
    <div id="fh5co-pricing">
		<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
   
    <h2 class="">Admin Login </h2>

    <!-- Icon -->
   <%-- <div class="fadeIn first">
      <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
    </div>--%>

    <!-- Login Form -->
    
      <input type="text" id="login" class="fadeIn second" name="login" placeholder="Email" runat="server"><br />
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Enter your email !" ControlToValidate="login"></asp:RequiredFieldValidator>
      <input type="password" id="password" class="fadeIn third" name="login"  placeholder="password" runat="server"><br />
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Enter your password !" ControlToValidate="password"></asp:RequiredFieldValidator>
     <br /><asp:label id="LabelError" runat="server" CssClass="text-danger"  visible="false" text="Invalid email or password"></asp:label>
        <br /> 
    
    <asp:Button ID="btlog" runat="server" Text="Login" CssClass="fadeIn fourth" UseSubmitBehavior="false" OnClick="btlog_Click" />

    <!-- Remind Passowrd -->
    <div id="formFooter">
     
    </div>

  </div>
</div>
		
	</div>


    </div>
    </form>
</body>
</html>
