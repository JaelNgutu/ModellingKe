<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Admin_Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
            <asp:EntityDataSource ID="EntityDataEvents" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=DmkDatabaseEntities" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="videos">

            
        </asp:EntityDataSource>
   

    <div class="container">

        	<div class="row" style="padding:2em">
       
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h2>Manage Youtube Videos</h2>
							
						</div>
					</div>
				</div>
			</div>

         <div class="row">
                <div class="col-md-6">

                 <asp:TextBox ID="Bio" CssClass="form-control" runat="server" TextMode="MultiLine" placeholder="Enter video link"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Please enter video link" ControlToValidate="Bio"></asp:RequiredFieldValidator>
                 </div>

                <asp:Button ID="addVid" runat="server" Text="Add Video" OnClick="addVid_Click" CausesValidation="true" />
                </div>
          <div class="row">
           <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataEvents" OnItemCommand="Repeater1_ItemCommand">

            <ItemTemplate>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  animate-box" style="padding-bottom:15px">

                        <iframe class="embed-responsive-item" src='<%# Eval("video") %>' ></iframe>
                 <asp:LinkButton ID="LinkButton1" runat="server" AutoPostback="false" CssClass=" btn btn-default btn-md" style="width:100%" Text="Like"  CommandArgument='<%#Eval("Id") %>' CausesValidation="false"  >Delete</asp:LinkButton>

                    </div>
     
                </ItemTemplate>
               </asp:Repeater>
         </div>
        </div>
</asp:Content>

