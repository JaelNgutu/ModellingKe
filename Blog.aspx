<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <asp:EntityDataSource ID="EntityDataEvents" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=DmkDatabaseEntities" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="videos">

            
        </asp:EntityDataSource>

    	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(WebsiteImages/blog.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Blog</h1>
						
                   <p><a href="https://www.youtube.com/watch?v=GDcBzCin6jE" class="btn btn-primary popup-youtube">Watch Our Latest Video</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	
	<div id="fh5co-blog" class="fh5co-bg-section">
		<div class="container">
			<div class="row animate-box">
			 
           <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataEvents" >

            <ItemTemplate>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
                     
                        <iframe class="embed-responsive-item" src='<%# Eval("video") %>' ></iframe>
          
                     <p><a href='<%# Eval("watch") %>' class="btn btn-primary popup-youtube">Watch Video</a></p>
                    </div>
     
                </ItemTemplate>
               </asp:Repeater>
        
			</div>
			
		
		</div>
	</div>





</asp:Content>

