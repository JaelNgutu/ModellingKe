<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Models.aspx.cs" Inherits="Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

          	<div id="fh5co-trainer">
                 <div class="container">

                 <div class="row" style="padding-bottom:10px">


                   

        <asp:EntityDataSource ID="EntityDataModels" runat="server"  ConnectionString="name=DmkDatabaseEntities" Select=""
             DefaultContainerName="DmkDatabaseEntities" orderby="it.[userID] desc"  EnableDelete="True" EnableFlattening="False"
             EnableInsert="True"
             EnableUpdate="True"  Where="it.[status]='Active' AND it.[gender] = @gender" EntitySetName="userInfo" >

            
              <WhereParameters>
                  <asp:QueryStringParameter Name="gender" QueryStringField="type" Type="String" />
                 
              </WhereParameters>
        </asp:EntityDataSource>


        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataModels">

            <ItemTemplate>
               
				<div class="col-lg-4 col-md-4 col-sm- col-xs-12  animate-box" style="padding-bottom:10px">
					<div class="trainer">
						<a href="/ViewProfile.aspx/<%# Eval("firstName") %><%# Eval("lastName") %>?pID=<%# Eval("userID") %>"><img class="img-responsive" style="height:500px" src= '<%# Eval("photo1") %>'  alt= '<%# Eval("firstName") %>' ></a>
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

