<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="Admin_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="fh5co-trainer">
        <div class="container">
       <div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading" style="margin-bottom:0">
					<h2>Registered Users</h2>
					
				</div>
			</div>
    </div>

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" orderby="it.[userID] desc" AutoGenerateWhereClause="true" ConnectionString="name=DmkDatabaseEntities" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="userInfo">

          

    </asp:EntityDataSource>
    

         
    
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSource1">
    

        <ItemTemplate>
            
      <div class="col-lg-4 col-md-4 col-sm- col-xs-12  animate-box" style="padding-bottom:10px">
					<div class="trainer">
						<a href="/Admin/RegisteredUser.aspx/<%# Eval("firstName") %><%# Eval("lastName") %>?pID=<%# Eval("userID") %>"><img class="img-responsive" style="height:500px" src= '<%# Eval("photo1") %>'  alt= '<%# Eval("firstName") %>' ></a>
						<div class="title">
							<h3><a href="#"> <%# Eval("firstName") %>   <%# Eval("lastName") %> </a></h3>
                                                        <span>Digital Models Kenya</span>
							
						</div>
						<div class="desc text-center">
							<ul class="fh5co-social-icons">
								<span> <%# Eval("firstName") %>   <%# Eval("lastName") %> : <%# Eval("status") %> </span>
							</ul>
						</div>
					</div>
				</div>
                 
 
				
        </ItemTemplate>

    </asp:Repeater>
        </div>
</asp:Content>

