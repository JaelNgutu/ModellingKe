<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   

    <div id="fh5co-pricing">

        <div class="container">

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>        
<script type="text/javascript">
    function checkDelete() {
        swal({
            title: "Reset link sent",
            text: "Check your email to reset your password",
            type: "success",
            showCancelButton: false,
            button: "Aww yiss!",
            closeOnConfirm: false
        });
    }
</script>

             <div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading" style="margin-top:5em;margin-bottom:0">
				
					<p> Enter your email address to reset password</p>
				</div>
			</div>

              <div class="modal-dialog animate-box" style="text-align:center">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" id="pwd">
        
        <h4 class="modal-title">Enter email address</h4><br />
          
      </div>
      <div class="modal-body">
			
          <div class="row">
                <div class="col-md-12">

                 <asp:TextBox ID="TextBoxNewPwd" CssClass="form-control"  runat="server" placeholder="Enter email address" TextMode="Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="Please enter your email address" ControlToValidate="TextBoxNewPwd"></asp:RequiredFieldValidator><br />
                    <asp:Label ID="Label1" runat="server" Text="Email doesnt exist, enter email used during registration" CssClass="text-danger"></asp:Label>
                 </div>
                </div>
          <br />
            <div class="row">
                <div class="col-md-12">
      <asp:Button ID="Button" runat="server" Text="Reset Password"  CausesValidation="true"  OnClick="Button_Click" />
                    </div>
              </div>

</div>
      </div>
    </div>

        </div>

        </div>



</asp:Content>

