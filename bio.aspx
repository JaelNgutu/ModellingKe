<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="bio.aspx.cs" Inherits="bio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <%-- bio modal--%>
        
               
     	<div id="fh5co-trainer">
                 <div class="container">
  <div class="modal-dialog" style="text-align:center">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" id="accBiod">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Tell us abit about yourself</h4><br />
          
      </div>
      <div class="modal-body">
			<div class="row">
                <div class="col-md-12">

                 <asp:TextBox ID="Bio" CssClass="form-control" Height="200px" runat="server" TextMode="MultiLine" placeholder="Enter bio text minimum (50)"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="oops you haven't typed anything" ControlToValidate="Bio"></asp:RequiredFieldValidator>
                 </div>
                </div>
          <div class="row">
                <div class="col-md-12">
      <asp:Button ID="Button2" runat="server" Text="Update Bio" OnClick="ButtonBio_Click" CausesValidation="true" />
                    </div>
              </div>

            <div class="row">
                <div class="col-md-12">
                   <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate = "Bio" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{50,}$" runat="server" ErrorMessage="Minimum 50 characters required."></asp:RegularExpressionValidator>
                    </div>
              </div>
</div>
      </div>
    </div>
  </div>
       <%-- bio modal end--%>

   </div>
  </div>

</asp:Content>

