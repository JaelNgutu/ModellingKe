<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreatePassword.aspx.cs" Inherits="CreatePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     	<div id="fh5co-trainer">
                 <div class="container">
  <div class="modal-dialog" style="text-align:center">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" id="pwd">
        
        <h4 class="modal-title">Create Password</h4><br />
          
      </div>
      <div class="modal-body">
			
          <div class="row">
                <div class="col-md-12">

                 <asp:TextBox ID="TextBoxNewPwd" CssClass="form-control"  runat="server" placeholder="Enter new password" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="Please enter password" ControlToValidate="TextBoxNewPwd"></asp:RequiredFieldValidator>
                 </div>
                </div>

            <div class="row">
                <div class="col-md-12">

                 <asp:TextBox ID="TextBoxComp" CssClass="form-control"  runat="server" placeholder="Confirm password" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Please confirm password" ControlToValidate="TextBoxComp"></asp:RequiredFieldValidator><br />
                    <asp:CompareValidator ID="CompareValidator1" CssClass="text-danger" runat="server" ErrorMessage="Oops! passwords do not match" ControlToCompare="TextBoxNewPwd" ControlToValidate="TextBoxComp"></asp:CompareValidator>  

                 </div>
                </div>

          <div class="row">
                <div class="col-md-12">
      <asp:Button ID="Button" runat="server" Text="Create Password"  CausesValidation="true" OnClick="Button_Click" />
                    </div>
              </div>
</div>
      </div>
    </div>
 </div>
             </div>


</asp:Content>

