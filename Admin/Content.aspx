<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Content.aspx.cs" Inherits="Admin_Content" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="fh5co-blog" class="fh5co-bg-section">

        	<div class="container">
			<div class="row">


				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<h2>Manage website images</h2>
					<p></p>
				</div>
			</div>
		</div>

		<div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">Contact Page Photo</h4>
   <asp:FileUpload ID="FileUpload1" runat="server"  /><br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Please select photo" ValidationGroup="Pic1"></asp:RequiredFieldValidator>
       
    <asp:Button ID="Button1" runat="server" Text="Change photo" ValidationGroup="Pic1" CausesValidation="true" OnClick="Button1_Click"   />
</div>

                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">Blog Page Photo</h4>
   <asp:FileUpload ID="FileUpload2" runat="server"  />
       
                     <br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ControlToValidate="FileUpload2" ErrorMessage="Please select photo" ValidationGroup="Pic2"></asp:RequiredFieldValidator>

    <asp:Button ID="Button2" runat="server" Text="Change photo" OnClick="Button2_Click" ValidationGroup="Pic2"  />
</div>
                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">Event Page Photo</h4>
   <asp:FileUpload ID="FileUpload3" runat="server"  />
       
                     <br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Please select photo" ValidationGroup="Pic3"></asp:RequiredFieldValidator>
    <asp:Button ID="Button3" runat="server" Text="Change photo" OnClick="Button3_Click" ValidationGroup="Pic3"  />
</div>

</div>

              <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">Portfolio Page Photo</h4>
   <asp:FileUpload ID="FileUpload4" runat="server"  />
       
                    <br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ControlToValidate="FileUpload4" ErrorMessage="Please select photo" ValidationGroup="Pic4"></asp:RequiredFieldValidator>

    <asp:Button ID="Button4" runat="server" Text="Change photo" OnClick="Button4_Click" ValidationGroup="Pic4"  />
</div>

                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">Home Page Photo 1</h4>
   <asp:FileUpload ID="FileUpload5" runat="server"  />
      
                     <br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ControlToValidate="FileUpload5" ErrorMessage="Please select photo" ValidationGroup="Pic5"></asp:RequiredFieldValidator>
                      
    <asp:Button ID="Button5" runat="server" Text="Change photo" OnClick="Button5_Click" ValidationGroup="Pic5" />
</div>
                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">Home Page Photo 2</h4>
   <asp:FileUpload ID="FileUpload6" runat="server"  />
     
                     <br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ControlToValidate="FileUpload6" ErrorMessage="Please select photo" ValidationGroup="Pic6"></asp:RequiredFieldValidator>
                       
    <asp:Button ID="Button6" runat="server" Text="Change photo" OnClick="Button6_Click" ValidationGroup="Pic6" />
</div>

</div>

             <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">Home Page Photo 3</h4>
   <asp:FileUpload ID="FileUpload7" runat="server"  />
  
                    <br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ControlToValidate="FileUpload7" ErrorMessage="Please select photo" ValidationGroup="Pic7"></asp:RequiredFieldValidator>
                         
    <asp:Button ID="Button7" runat="server" Text="Change photo" OnClick="Button7_Click" ValidationGroup="Pic7" />
</div>

                   <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">Bottom Page Photo</h4>
   <asp:FileUpload ID="FileUpload8" runat="server"  />
      
                       <br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="text-danger" runat="server" ControlToValidate="FileUpload8" ErrorMessage="Please select photo" ValidationGroup="Pic8"></asp:RequiredFieldValidator> 

    <asp:Button ID="Button8" runat="server" Text="Change photo" OnClick="Button8_Click" ValidationGroup="Pic8" />
</div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
   <h4 style="margin-left:20px;font-weight:600">SignUp Page Photo </h4>
   <asp:FileUpload ID="FileUpload9" runat="server"  />
    
                        <br />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator9" CssClass="text-danger" runat="server" ControlToValidate="FileUpload9" ErrorMessage="Please select photo" ValidationGroup="Pic9"></asp:RequiredFieldValidator>
                           
    <asp:Button ID="Button9" runat="server" Text="Change photo" OnClick="Button9_Click" ValidationGroup="Pic9" />
</div>

                 </div>

            </div>
        </div>

</asp:Content>

