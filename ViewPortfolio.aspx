<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPortfolio.aspx.cs" Inherits="ViewPortfolio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
   <%--   <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImgPrv.ClientID%>').prop('src', e.target.result)
                        .width(300)
                        .height(300);
                };
                reader.readAsDataURL(input.files[0]);
                }
        }

      
    </script>

      <%-- update portfolio modal--%>
   
                <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog" style="text-align:center">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" id="accModal">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Update Portfolio Photo</h4><br />
          
      </div>
      <div class="modal-body">

			<div class="row" >
                 <div class="col-md-2">
                   </div>
                <div class="col-md-8" style="text-align:center">

                 <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true"  onchange="ShowImagePreview(this);"  />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ValidationGroup="portfolio" CssClass="text-danger" ErrorMessage="Please select photo"></asp:RequiredFieldValidator>

                     </div>
                 </div>
          
          <div class="row">
               <div class="col-md-2">
                   </div>
                <div class="col-md-8">
                         <asp:Image ID="ImgPrv" Height="300px" Width="300px"   class="img-responsive" runat="server"  />
                <asp:Button ID="Button1" runat="server" Text="Update Portfolio"  ValidationGroup="portfolio" OnClick="BtnPortFolio_Click" />
                 </div>
                 </div>
</div>

      </div>
      
    </div>

  </div>

      <%--  update portfolio end--%>

     <asp:entitydatasource id="EDS_Profile" autogeneratewhereclause="True"  connectionstring="name=DmkDatabaseEntities" defaultcontainername="DmkDatabaseEntities" runat="server" entitysetname="userInfo" enableflattening="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True" >
       
            <WhereParameters>
            <asp:QueryStringParameter Name="userID"
                QueryStringField="pID" Type="Int32" />
        </WhereParameters>
          </asp:entitydatasource>

     <asp:FormView ID="FormView1" runat="server"  DataSourceID="EDS_Profile" style="width:100%" >

               <ItemTemplate>
                   
    <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style='background-image:url(<%# Eval("photo1") %>)' data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1><%#Eval("firstName") %> <%#Eval("lastName") %></h1>
							<h2>Take a look at some of my work </h2>
<asp:LinkButton ID="Button2" CssClass="btn btn-info" data-toggle="modal" data-target="#myModal" runat="server">Update Portfolio</asp:LinkButton>

                           <%--   <button id="updateButton" runat="server" type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Update Portfolio</button>--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

                   </ItemTemplate>

        

         </asp:FormView>
    	
	<div id="fh5co-pricing">
		
          <asp:Entitydatasource ID="EntityDataModels" runat="server" ConnectionString="name=DmkDatabaseEntities" AutoGenerateWhereClause="true" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="portfolio">

                <WhereParameters>
            <asp:QueryStringParameter Name="userID"
                QueryStringField="pID" Type="Int32" />
        </WhereParameters>
          </asp:Entitydatasource>

        	<div class="row">


				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
					<h2>My Portfolio</h2>
					<p></p>
				</div>
			</div>

        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="EntityDataModels">

            <ItemTemplate>
               
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
					 <a href='<%# Eval("image") %>'  class="port-photo image-popup"   style='background-image:url(<%# Eval("image") %>)'>
                           <img class="port-photo "   style='background-image:url(<%# Eval("image") %>)'  >    
                           </a>
                        </div>

            </ItemTemplate>

        </asp:Repeater>
			
	</div>

 

</asp:Content>

