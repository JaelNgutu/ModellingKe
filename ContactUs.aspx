<%@ Page Title="ContactUs | Digital Models Kenya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(WebsiteImages/contact.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">

					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Contact Us</h1>
							<h2>We're happy to here from you </h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

  
	
	<div id="fh5co-contact">
		<div class="container">
			<div class="row">
				<div class="col-md-5 col-md-push-1 animate-box">
					
					<div class="fh5co-contact-info">
						<h3>Contact Information</h3>
						<ul>
							<li class="address" style="color:#000000">Nairobi , Kenya</li>
							<li class="phone" style="color:#000000">+ 1235 2355 98</li>
							<li class="email" style="color:#000000">info@digitalModelsKenya.com</li>
							
						</ul>
					</div>

				</div>
				<div class="col-md-6 animate-box">
					<h3>Get In Touch</h3>
					
						<div class="row form-group">
							<div class="col-md-6">
								<!-- <label for="fname">First Name</label> -->
<asp:textbox runat="server" id="fname"  MaxLength="30" placeholder="First Name" ></asp:textbox>
					<asp:requiredfieldvalidator ID="fel" runat="server" errormessage="First Name!" CssClass="text-danger" ControlToValidate="fname" ></asp:requiredfieldvalidator>		 
							</div>
							<div class="col-md-6">
								<asp:textbox runat="server" id="lname"  MaxLength="30" placeholder="Last Name" ></asp:textbox>
					<asp:requiredfieldvalidator ID="requiredfieldvalidator" runat="server" CssClass="text-danger" errormessage="Last Name!" ControlToValidate="lname" ></asp:requiredfieldvalidator>		 
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
									<asp:textbox runat="server" id="email"  MaxLength="100" placeholder="Your Email" ></asp:textbox>
					<asp:requiredfieldvalidator ID="requiredfieldvalidator1" runat="server" CssClass="text-danger" errormessage="Email!" ControlToValidate="email" ></asp:requiredfieldvalidator>		 
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">

                                	<asp:textbox runat="server" id="subject"  MaxLength="30"  placeholder="Your subject of this message" ></asp:textbox>
					<asp:requiredfieldvalidator ID="requiredfieldvalidator2" runat="server" CssClass="text-danger" errormessage="Subject!" ControlToValidate="lname" ></asp:requiredfieldvalidator>		 
								<!-- <label for="subject">Subject</label> -->
							
							</div>
						</div>

						<div class="row ">
							<div class="col-md-12">

                                
                                	<asp:textbox runat="server" id="message" CssClass="form-control"   height="200px" MaxLength="500"  placeholder="Say something about us" ></asp:textbox>
					<asp:requiredfieldvalidator ID="requiredfieldvalidator3" runat="server" CssClass="text-danger" errormessage="Message!" ControlToValidate="message" ></asp:requiredfieldvalidator>		 
								

								
							</div>
						</div>
						<div class="form-group">

							 <asp:Button ID="Button1" runat="server" Text="Send" CssClass="signup"  CausesValidation="true" OnClick="Button1_Click"/><br>
						</div>

					
				</div>
			</div>
			
		</div>
	</div>

   
</asp:Content>

