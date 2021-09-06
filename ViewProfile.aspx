<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="ViewProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

        	<div id="fh5co-trainer">
                 <div class="container-fluid">

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

        <asp:TextBox ID="Email" CssClass="form-control" runat="server" placeholder="someone@example.com"></asp:TextBox><br />
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
       <asp:Button ID="Button1" runat="server" Text="Send" CssClass="signup"  CausesValidation="true" OnClick="Button1_Click"/><br>
           
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


       <asp:FormView ID="Repeater1" runat="server"  DataSourceID="EDS_Profile"  Width="100%">

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
                      <p>Age:<span style="color:#000"><%#Eval("age") %></span></p>
                      <p>Gender:<span style="color:#000"><%#Eval("gender") %></span></p>
                     <br /> 
                      <h3>Bio</h3>
                      <p>
                          <%#Eval("bio") %>
                      </p>
</div>
                      
                             
                           
                               <div class="row">

                                   <div class="col-md-12"><br />
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Hire Me</button>
                                       <a class="btn btn-info" href="/ViewPortfolio.aspx/<%# Eval("firstName") %><%# Eval("lastName") %>?pID=<%# Eval("userID") %>">portfolio</a>
                                       
 
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

