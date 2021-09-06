<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewUserAccounts.aspx.cs" Inherits="Admin_ViewUserAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <style>
.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 80%;
    height:400px;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
    padding: 2px 16px;
}
</style>
        


    <div class="container">
       <div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading" style="margin-bottom:0">
					<h2>Registered Users</h2>
					
				</div>
			</div>
    </div>

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="true" ConnectionString="name=DmkDatabaseEntities" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="userInfo">

          <WhereParameters>
                  <asp:QueryStringParameter Name="status" QueryStringField="type" Type="String" />
              </WhereParameters>

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
</asp:Content>

