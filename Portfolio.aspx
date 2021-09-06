<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Portfolio.aspx.cs" Inherits="Portfolio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(WebsiteImages/portfolio.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Portfolio</h1>
							<h2>Here is some of our work </h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

  	<div id="fh5co-trainer">
                 <div class="container">
                     <div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
				
					<p> Explore individual model portfolio</p>
				</div>
			</div>
                 <div class="row" style="padding-bottom:10px">

                     <asp:EntityDataSource ID="EntityDataModels" runat="server" ConnectionString="name=DmkDatabaseEntities"
                          DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" Where="it.[status]='Active'" EnableInsert="True" EnableUpdate="True" EntitySetName="userInfo"></asp:EntityDataSource>

                       <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataModels">

            <ItemTemplate>
               
				<div class="col-lg-4 col-md-4 col-sm- col-xs-12  animate-box" style="padding-bottom:10px">
					<div class="trainer">
						<a href="/ViewPortfolio.aspx/<%# Eval("firstName") %><%# Eval("lastName") %>?pID=<%# Eval("userID") %>"><img class="img-responsive" style="height:500px" src= '<%# Eval("photo1") %>'  alt= '<%# Eval("firstName") %>' ></a>
						<div class="title">
							<h3><a href="#"> <%# Eval("firstName") %>   <%# Eval("lastName") %> </a></h3>
                                                        <span>Digital Models Kenya</span>
							
						</div>
						<div class="desc text-center">
							<ul class="fh5co-social-icons">
								<span> <%# Eval("firstName") %>   <%# Eval("lastName") %> </span>
							</ul>
						</div>
					</div>
				</div>
                 

            </ItemTemplate>

        </asp:Repeater>

                     </div>
                     </div>
                </div>




</asp:Content>

