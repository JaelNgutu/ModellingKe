<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImgPrv.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
                }
        }

         function ShowImagePreview1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImgPrv1.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
                }
         }

         function ShowImagePreview2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImgPrv2.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
                }
         }

         function ShowImagePreview3(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImgPrv3.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>

            <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" id="accModal">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Upload 4 of your best photos</h4><br />
          
      </div>
      <div class="modal-body">
<div class="row">

    <div class="col-md-6">
          <asp:FileUpload ID="FileUploadPic" runat="server"  onchange="ShowImagePreview(this);"  />
        <asp:Image ID="ImgPrv" Height="200px" Width="200px"   class="img-responsive" runat="server"  />
    </div>
    
    <div class="col-md-6">
        <asp:FileUpload ID="FileUpload1" runat="server"  onchange="ShowImagePreview1(this);"  />
         <asp:Image ID="ImgPrv1" Height="200px" Width="200px"   class="img-responsive" runat="server"  />
    </div>

</div>

          <div class="row">

    <div class="col-md-6">
        <asp:FileUpload ID="FileUpload2" runat="server"  onchange="ShowImagePreview2(this);"  />
         <asp:Image ID="ImgPrv2" Height="200px" Width="200px"   class="img-responsive" runat="server"  />
    </div>
    
    <div class="col-md-6">
        <asp:FileUpload ID="FileUpload3" runat="server"  onchange="ShowImagePreview3(this);"  />
         <asp:Image ID="ImgPrv3" Height="200px" Width="200px"   class="img-responsive" runat="server"  />
    </div>

</div>
           
         
      </div>
      <div class="modal-footer" style="text-align:center" >
       <asp:Button ID="Button1" runat="server" Text="Done" CssClass="signup" data-dismiss="modal" CausesValidation="false"/><br>
           
      </div>
    </div>

  </div>
</div>

    <div id="fh5co-trainer" >
    		<div class="container">
			
			<div class="row">
                           <div class="content-wrapper">
        <div class="content">
            <div class="signup-wrapper shadow-box">
                <div class="company-details ">
                  
                    <div class="shadow"></div>
                    <div class="wrapper-1">
                        <div class="logo">
       <div class="icon-food">
         
                    </div>
                        </div>
                        <h1 class="title">Digital Models Kenya</h1>
                        <div class="slogan">Join Us Today.</div>
                    </div>

                </div>
                <div class="signup-form ">
                    <div class="wrapper-2">
                        <div class="row">
                            <div class="col-md-12">
                                 <div class="form-title">Sign up </div>
                            </div>
                             
                        </div>
                      
                        <div class="form">
                           


                                <div class="row">
                                    <div class="col-md-6">
                                          <p class="content-item">
                                    <label>First Name
                                        <input ID="tbFirstName" runat="server" MaxLength="30" type="text" placeholder="First Name"  required>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="tbFirstName"></asp:RequiredFieldValidator>
                                    </label>
                                </p>
                                    </div>
                                    
                                    <div class="col-md-6">
                                         <p class="content-item">
                                    <label>Last Name
                                        <input ID="tbLastName" runat="server" MaxLength="30" type="text" placeholder="Last Name"  required>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="tbLastName"></asp:RequiredFieldValidator>
                                    </label>
                                </p>
                                    </div>
                                </div>
                                     <div class="row">
                                         <div class="col-md-6">
                                                         <p class="content-item">
                                    <label>email address
                                        <input type="text" id="tbEmail" runat="server" maxlength="100"  placeholder="email@you.com" name="email" required>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" ErrorMessage="someone@example.com" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </label>
                                </p>
                                         </div>
                                         <div class="col-md-6">
                                              <p class="content-item">
                                    <label>Phone Number
                                        <input type="text" placeholder="Your PhoneNumber" id="tbNumber" runat="server" maxlength="10" required>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="The number field is Required !" ControlToValidate="tbNumber"></asp:RequiredFieldValidator>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidatorNumber" CssClass="text-danger" runat="server" ErrorMessage="invalid input" ControlToValidate="tbNumber" ValidationExpression="\d+"></asp:RegularExpressionValidator>  
                                       
                                    </label>
                                </p>
                                         </div>
                                        
                                     </div>
                                
                                 <div class="row">
                                     <div class="col-md-6">
                                           <p class="content-item">
                                    <label>Age
                                        <input type="text"  id="tbAge" placeholder="Your age" runat="server" maxlength="2"  required>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" CssClass="text-danger" runat="server" ErrorMessage="The age field is Required !" ControlToValidate="tbAge"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorAge" CssClass="text-danger" runat="server" ErrorMessage="invalid input" ControlToValidate="tbAge" ValidationExpression="\d+"></asp:RegularExpressionValidator>  
                                    </label>
                                </p>
                                     </div>

                                     <div class="col-md-6">
                                          <p class="content-item">
                                    <label>Gender<br />
                                     <asp:RadioButtonList id="RadioButtonList1" runat="server">
    <asp:ListItem value="male">male</asp:ListItem>
    <asp:ListItem value="female">female</asp:ListItem>
</asp:RadioButtonList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
            ControlToValidate="RadioButtonList1" CssClass="text-danger" ErrorMessage="The gender field is required">
        </asp:RequiredFieldValidator>
                                    </label>
                                </p>
                                     </div>
                                   
                                         
                                     </div>


                              <div class="row">
                                    <div class="col-md-6">
                                          <p class="content-item">
                                    <label>Upload your photos (required)
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Upload photos</button>
      <asp:Label ID="Label1" CssClass="text-danger" runat="server" Text="Please upload 4 photos!"></asp:Label>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please upload 4 photos!" CssClass="text-danger" ControlToValidate="FileUploadPic"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="text-danger" ErrorMessage="Please upload 4 photos!" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="text-danger" ErrorMessage="Please upload 4 photos!" ControlToValidate="FileUpload2"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"  CssClass="text-danger" ErrorMessage="Please upload 4 photos!" ControlToValidate="FileUpload3"></asp:RequiredFieldValidator>

                                    </label>
                                </p>
                                    </div>
                                    
                                  
                                </div>

                                      <div class="row">
                                  <div class="col-md-6">
                                         
                                            <asp:Button ID="btReg" runat="server" Text="Register" CssClass="signup" UseSubmitBehavior="false"  OnClick="userReg_Click"/>
                               
                                     </div>

                                         
                                
                            </div>
                            
                          
                               
                                 </div>
                          
                           
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>


    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

				
			
			</div>
    </div>

</asp:Content>

