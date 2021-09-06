<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="RegisteredUser.aspx.cs" Inherits="Admin_RegisteredUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="fh5co-trainer">
                 <div class="container">

                     <%-- bio modal--%>

    <div id="myBio" class="modal fade" role="dialog">
        <div class="modal-dialog" style="text-align: center">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" id="accBiod">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update user bio</h4>
                    <br />

                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">

                            <asp:TextBox ID="Bio" CssClass="form-control" Height="100px" runat="server" ValidationGroup="bio" TextMode="MultiLine" placeholder="Enter bio text minimum (50)"></asp:TextBox>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="Oops you haven't typed anything" ControlToValidate="Bio" ValidationGroup="bio"></asp:RequiredFieldValidator>--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="Button2" runat="server" Text="Update Bio"  OnClick="Button2_Click" ValidationGroup="bio" /><br />
                          <%--  <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="Bio" ID="RegularExpressionValidator2" ValidationGroup="bio" ValidationExpression="^[\s\S]{318,}$" runat="server" ErrorMessage="Minimum 60 words required."></asp:RegularExpressionValidator>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- bio modal end--%>

                     <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" id="accModal">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Hire Me!</h4><br />
          
      </div>
      <div class="modal-body">
<div class="row">

    <div class="col-md-12">
         <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Your email address*"></asp:Label>

        <asp:TextBox ID="Email" CssClass="form-control" runat="server" placeholder="someone@example.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Please enter your email" ControlToValidate="Email"></asp:RequiredFieldValidator>
    </div>
    </div>
  <div class="row">

    <div class="col-md-12">
        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Message*"></asp:Label>
                  
     <asp:TextBox ID="Message" CssClass="form-control" Height="100px" runat="server" TextMode="MultiLine" placeholder="what type of job would you like to hire me for"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Cannot send blank message" ControlToValidate="Message"></asp:RequiredFieldValidator>
                  
 
    </div>
      </div>
</div>

        
         <div class="modal-footer" style="text-align:center" >
       <asp:Button ID="Button1" runat="server" Text="Send" CssClass="signup" data-dismiss="modal" CausesValidation="false"/><br>
           
      </div>
      </div>
      
    </div>

  </div>

    
  <%--  <asp:EntityDataSource ID="EDS_Product" runat="server" Include="Country,Userdata" AutoGenerateWhereClause="True"
        EnableFlattening="False"
        ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities"
        EntitySetName="Products" Where="" EnableUpdate="True">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProductID"
                QueryStringField="pID" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>--%>


    <asp:entitydatasource id="EDS_Profile" autogeneratewhereclause="True"  connectionstring="name=DmkDatabaseEntities" defaultcontainername="DmkDatabaseEntities" runat="server" entitysetname="userInfo" enableflattening="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True" >
       
            <WhereParameters>
            <asp:QueryStringParameter Name="userID"
                QueryStringField="pID" Type="Int32" />
        </WhereParameters>
          </asp:entitydatasource>


       <asp:FormView ID="FormView1" runat="server"  DataSourceID="EDS_Profile" Width="100%" >

               <ItemTemplate>

                           <div class="container-fluid" >
            <div class="row">
                <div class="col-md-8">
                   <div id="myCarousel" class="carousel slide" data-ride="carousel" style=" height:600px;
 width: 100%;
 overflow: hidden;">
    <%-- Indicators --%>
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <a href='<%# Eval("photo1") %>'  class="port-photo2 image-popup"   style='background-image:url(<%# Eval("photo1") %>)'>
                           <img class="port-photo2 "   style='background-image:url(<%# Eval("photo1") %>)'  >    
                           </a>
      </div>
       
      <div class="item">
        <a href='<%# Eval("photo2") %>'  class="port-photo2 image-popup"   style='background-image:url(<%# Eval("photo2") %>)'>
                           <img class="port-photo2 "   style='background-image:url(<%# Eval("photo2") %>)'  >    
                           </a>
      </div>
    
      <div class="item">
         <a href='<%# Eval("photo3") %>'  class="port-photo2 image-popup"   style='background-image:url(<%# Eval("photo3") %>)'>
                           <img class="port-photo2 "   style='background-image:url(<%# Eval("photo3") %>)'  >    
                           </a>
      </div>
         <div class="item">
        <a href='<%# Eval("photo4") %>'  class="port-photo2 image-popup"   style='background-image:url(<%# Eval("photo4") %>)'>
                           <img class="port-photo2 "   style='background-image:url(<%# Eval("photo4") %>)'  >    
                           </a>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="icon-arrow-with-circle-left" style="font-size:50px;color:#FFF"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="icon-arrow-with-circle-right" style="font-size:50px;color:#FFF"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
                </div>
                
                  <div class="col-md-4" id="userprof">
                        <div class="row">
                          <h2> <asp:Label ID="Label2" runat="server" Text='<%# string.Concat(Eval("firstName"), " ", Eval("lastName"))%>'></asp:Label></h2>
                      <p>Age: <span style="color:#000"><%#Eval("age") %></span></p>
                      <p>Gender: <span style="color:#000"><%#Eval("gender") %></span></p>
                            <p>Number: <span style="color:#000"><%#Eval("phoneNumber") %></span></p>
                            <p>Email: <span style="color:#000"><asp:Label ID="Label4" runat="server" Text=' <%#Eval("email") %>'></asp:Label></span></p>
                              <p style="font-weight:bold">Status:<span style="color:#000"><asp:Label ID="LabelStatus" runat="server" Text=' <%#Eval("status") %>'></asp:Label></span></p>
                     <br /> 

                           
<br />
                      <h3> Bio: <button type="button" class="btn btn-ctm" data-toggle="modal" data-target="#myBio">User Bio <i class="icon-paper-clip"></i></button></h3>
                      <p>
                          <%#Eval("bio") %>
                          <br />
                            <br />
                      </p>
</div>
                      
                             
                           
                               <div class="row">

                                   <div class="col-md-6"><br />
                                    <asp:Button ID="ButtonDPost" runat="server"  Text="Activate Account" CssClass="btn-danger" BackColor="#25B2B0" BorderColor="#25B2B0" OnClick="ButtonActivate_Click" CausesValidation="false" UseSubmitBehavior="false" />

                                          <asp:Button ID="ButtonDeact" runat="server"  Text="Deactivate Account" CssClass="btn-danger" BackColor="#25B2B0" BorderColor="#25B2B0"  OnClick="ButtonDeact_Click" CausesValidation="false"  UseSubmitBehavior="false" />

                                         <asp:Button ID="ButtonDelete" runat="server"  Text="Delete Account" CssClass="btn-danger" BackColor="#25B2B0" BorderColor="#25B2B0"  OnClick="ButtonDelete_Click" CausesValidation="false"  UseSubmitBehavior="false" />
                                 
                                    
 
                                   </div>


                                
                               </div>
          
                </div>
            
        </div>
        </div>

                   </ItemTemplate>
           </asp:FormView>

                     </div>
                </div>

          
</asp:Content>



