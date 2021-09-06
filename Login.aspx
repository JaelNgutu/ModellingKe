<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="fh5co-pricing">
		<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
   
    <h2 class="">Login </h2>

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
        <br /> <asp:Button ID="btReg" runat="server" Text="Login" CssClass="fadeIn fourth" UseSubmitBehavior="false" OnClick="Login_Click" />
    
   

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="tColor" href="ForgotPassword.aspx">Forgot Password?</a>
    </div>

  </div>
</div>
		
	</div>

</asp:Content>

