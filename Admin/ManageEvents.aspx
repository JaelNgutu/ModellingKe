<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageEvents.aspx.cs" Inherits="Admin_ManageEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
     <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
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

                <div id="myModal" class="modal fade" role="dialog" style="text-align:center">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" id="accModal">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add New Event</h4><br />
          
      </div>
      <div class="modal-body">
<div class="row">
    <div class="col-md-2">

    </div>

    <div class="col-md-8" style="text-align:center;align-content:center">
          <asp:FileUpload ID="FileUploadPic" runat="server"  onchange="ShowImagePreview(this);"  />
        <asp:Image ID="ImgPrv" Height="300px" Width="300px"   class="img-responsive" runat="server"  />
    </div>
    
    

</div>

        
           
         
      </div>
      <div class="modal-footer" style="text-align:center" >
       <asp:Button ID="addEvent" runat="server" Text="Add New Event" CssClass="signup"  OnClick="addEvent_Click"/><br>
           
      </div>
    </div>

  </div>
</div>

     

    		<div class="container-fluid">

                                            		<div class="row" style="padding:2em">
       
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h2>Manage Events</h2>
							 <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Add Event</button>
						</div>
					</div>
				</div>
			</div>

            <asp:EntityDataSource ID="EntityDataEvents" runat="server" AutoGenerateWhereClause="true" ConnectionString="name=DmkDatabaseEntities" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Events">

            
        </asp:EntityDataSource>

			<div class="row row-bottom-padded-md">
         
				<div class="gallery">
					
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataEvents" OnItemCommand="Repeater1_ItemCommand">

            <ItemTemplate>
                	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">
					 <a href='<%# Eval("image") %>'  class="port-photo image-popup"   style='background-image:url(<%# Eval("image") %>)'>
                           <img class="port-photo "   style='background-image:url(<%# Eval("image") %>)'  >    
                           </a>

                          <asp:LinkButton ID="LinkButton1" runat="server" AutoPostback="false" CssClass=" btn btn-default btn-md" style="width:100%" Text="Like"  CommandArgument='<%#Eval("eventID") %>'  >Delete <span class="fa fa-thumbs-o-up"> </asp:LinkButton>
                        </div>

                       
				

                </ItemTemplate>
                            </asp:Repeater>
                       
				</div>
			</div>
		</div>

</asp:Content>

