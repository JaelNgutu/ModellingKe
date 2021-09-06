<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Event.aspx.cs" Inherits="Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(WebsiteImages/event.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
       
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Our Events</h1>
							<h2>Take a look at some of our events </h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

       <asp:EntityDataSource ID="EntityDataEvents" runat="server" AutoGenerateWhereClause="true" ConnectionString="name=DmkDatabaseEntities" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Events">

            
        </asp:EntityDataSource>


    	<div id="fh5co-gallery">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<h2>Our Events</h2>
					<p>Take a look at some of our events.</p>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row row-bottom-padded-md">
	
       <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataEvents">

            <ItemTemplate>
             
                	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
					 <a href='<%# Eval("image") %>'  class="port-photo image-popup"   style='background-image:url(<%# Eval("image") %>)'>
                           <img class="port-photo "   style='background-image:url(<%# Eval("image") %>)'  >    
                           </a>
                        </div>
                </ItemTemplate>
                            </asp:Repeater>
                       

			</div>
		</div>
	</div>


    	
</asp:Content>

