<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


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

     function ShowImagePreview2(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#<%=ImgPrv2.ClientID%>').prop('src', e.target.result)
                        .width(300)
                        .height(300);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }

            function ShowImagePreview3(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#<%=ImgPrv3.ClientID%>').prop('src', e.target.result)
                        .width(300)
                        .height(300);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }

            function ShowImagePreview4(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#<%=ImgPrv4.ClientID%>').prop('src', e.target.result)
                        .width(300)
                        .height(300);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }

            function ShowImagePreview5(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#<%=ImgPrv5.ClientID%>').prop('src', e.target.result)
                        .width(300)
                        .height(300);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>

    <asp:EntityDataSource ID="EDS_profile"
        runat="server" ConnectionString="name=DmkDatabaseEntities"
        AutoGenerateWhereClause="True"
        DefaultContainerName="DmkDatabaseEntities" EnableFlattening="False"
        EntitySetName="userInfo">
        <WhereParameters>
            <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="EDS_photos" runat="server" ConnectionString="name=DmkDatabaseEntities" AutoGenerateWhereClause="true" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="userInfo">

        <WhereParameters>
            <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
        </WhereParameters>

    </asp:EntityDataSource>

    <asp:EntityDataSource ID="EDS_portfolio" runat="server" ConnectionString="name=DmkDatabaseEntities" AutoGenerateWhereClause="true" DefaultContainerName="DmkDatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="portfolio">

        <WhereParameters>
            <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
        </WhereParameters>

    </asp:EntityDataSource>


    <%-- bio modal--%>

    <div id="myBio" class="modal fade" role="dialog">
        <div class="modal-dialog" style="text-align: center">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" id="accBiod">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update your bio</h4>
                    <br />

                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">

                            <asp:TextBox ID="Bio" CssClass="form-control" Height="100px" runat="server" ValidationGroup="bio" TextMode="MultiLine" placeholder="Enter bio text minimum (50)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Oops you haven't typed anything" ControlToValidate="Bio" ValidationGroup="bio"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="Button2" runat="server" Text="Update Bio" OnClick="ButtonBio_Click" ValidationGroup="bio" /><br />
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="Bio" ID="RegularExpressionValidator2" ValidationGroup="bio" ValidationExpression="^[\s\S]{318,}$" runat="server" ErrorMessage="Minimum 60 words required."></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- bio modal end--%>

    <%--change password start--%>

    <div id="myPassword" class="modal fade" role="dialog">
        <div class="modal-dialog" style="text-align: center">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" id="pwd">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Change Password</h4>
                    <br />

                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">

                            <asp:TextBox ID="TextBoxNewPwd" CssClass="form-control" runat="server" placeholder="Enter new password" TextMode="Password"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="Please enter new password" ControlToValidate="TextBoxNewPwd" ValidationGroup="password"></asp:RequiredFieldValidator><br />
                             <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TextBoxNewPwd" CssClass="text-danger" ID="RegularExpressionValidator1" ValidationGroup="password" ValidationExpression="^[\s\S]{6,}$" runat="server" ErrorMessage="Password too short,minimum 6 characters"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                       <div class="row">
                        <div class="col-md-12">

                            <asp:TextBox ID="TextBoxConfirm" CssClass="form-control" runat="server" placeholder="Confirm new password" TextMode="Password"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ErrorMessage="Please confirm password" ControlToValidate="TextBoxConfirm" ValidationGroup="password"></asp:RequiredFieldValidator><br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" ControlToValidate="TextBoxConfirm" ControlToCompare="TextBoxNewPwd"  ValidationGroup="password"></asp:CompareValidator>
                            
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="Button4" runat="server" Text="Change Password" OnClick="ButtonChangePassword_Click"  ValidationGroup="password" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--change password end--%>





    <%-- profile pic modal--%>

    <div class="modal fade" id="confirm-logout" tabindex="-1" role="dialog" aria-labelledby="logoutLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title">Update profile picture</h4>
                </div>

                <div class="modal-body">
                    
   <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8" style="text-align: center">

                            <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true" onchange="ShowImagePreview2(this);" />

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload2"  CssClass="text-danger" ErrorMessage="Please select photo" ValidationGroup="pic1"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <asp:Image ID="ImgPrv2" Height="300px" Width="300px" class="img-responsive" runat="server" />
                            <asp:Button ID="Button3" runat="server" Text="Update Image" OnClick="Button3_Click"  ValidationGroup="pic1" />
                        </div>
                    </div>

                </div>

              
            </div>
        </div>
    </div>
    <%--   profile modal end--%>

    <%-- profil2e pic modal--%>

    <div id="myProf2" class="modal fade" role="dialog">
        <div class="modal-dialog" style="text-align: center">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" id="accBio2">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update profile picture</h4>
                    <br />

                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8" style="text-align: center">

                            <asp:FileUpload ID="FileUpload3" runat="server" AllowMultiple="true" onchange="ShowImagePreview3(this);" />
                       
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FileUpload3"  CssClass="text-danger" ErrorMessage="Please select photo" ValidationGroup="pic2"></asp:RequiredFieldValidator>
                            
                             </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <asp:Image ID="ImgPrv3" Height="300px" Width="300px" class="img-responsive" runat="server" />
                            <asp:Button ID="Button5" runat="server" Text="Update Image" OnClick="Button5_Click"  ValidationGroup="pic2" />
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <%--   profile2 modal end--%>

    <%-- profil3 pic modal--%>

    <div id="myProf3" class="modal fade" role="dialog">
        <div class="modal-dialog" style="text-align: center">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" id="accBio3">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update profile picture</h4>
                    <br />

                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8" style="text-align: center">

                            <asp:FileUpload ID="FileUpload4" runat="server" AllowMultiple="true" onchange="ShowImagePreview4(this);" />
                      
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FileUpload4"  CssClass="text-danger" ErrorMessage="Please select photo" ValidationGroup="pic3"></asp:RequiredFieldValidator>
                            
                              </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <asp:Image ID="ImgPrv4" Height="300px" Width="300px" class="img-responsive" runat="server" />
                            <asp:Button ID="Button6" runat="server" Text="Update Image" OnClick="Button6_Click" ValidationGroup="pic3" />
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <%--   profile2 modal end--%>


    <%-- profil2e pic modal--%>

    <div id="myProf4" class="modal fade" role="dialog">
        <div class="modal-dialog" style="text-align: center">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" id="accBio4">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update profile picture</h4>
                    <br />

                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8" style="text-align: center">

                            <asp:FileUpload ID="FileUpload5" runat="server" AllowMultiple="true" onchange="ShowImagePreview5(this);" />
                       
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileUpload5"  CssClass="text-danger" ErrorMessage="Please select photo" ValidationGroup="pic4"></asp:RequiredFieldValidator>

                        </div>
                            
                            
                             </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <asp:Image ID="ImgPrv5" Height="300px" Width="300px" class="img-responsive" runat="server" />
                            <asp:Button ID="Button7" runat="server" Text="Update Image" OnClick="Button7_Click"  ValidationGroup="pic4"/>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <%--   profile2 modal end--%>

    <style>
        .caption div {
            box-shadow: 0 0 5px #C8C8C8;
            transition: all 0.3s ease 0s;
        }

        .img-circle {
            border-radius: 50%;
        }

        .img-circle {
            border-radius: 0;
        }

        .ratio {
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            height: 0;
            padding-bottom: 100%;
            position: relative;
            width: 100%;
        }

        .img-circle {
            border-radius: 50%;
        }

        .img-responsive {
            display: block;
            height: auto;
            max-width: 100%;
        }
    </style>


    <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background: linear-gradient(to bottom right, #7b4397,#dc2430); height: 300px" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 text-center">
                </div>
            </div>
        </div>
    </header>

    <div id="fh5co-trainer" style="background-color: #EFEFEF">
        <div class="container-fluid">

            <div class="container-fluid">

                <div class="row">
                    <asp:FormView ID="Repeater1" runat="server" DataSourceID="EDS_profile" HorizontalAlign="Center">
                        <ItemTemplate>

                            <div class="innerwrap" style="margin-top: -200px">
                                <section class="section1 clearfix">
                                    <div>
                                        <div class="row grid clearfix">
                                            <div class="col2 first">
                                                <img src=' <%#Eval("photo1")%>' alt="">
                                                <h1><%#Eval("firstName")%> <%#Eval("lastName")%></h1>
                                                <p>Age: <%#Eval("age")%></p>
                                                <p>Gender: <%#Eval("gender")%></p>
                                                <p>Email: <%#Eval("email")%></p>
                                                <p>Phone: <%#Eval("phoneNumber")%></p>

                                            </div>
                                            <div class="col2 last">
                                                <div class="grid clearfix">
                                                    <h3>Bio:</h3>
                                                    <p><%#Eval("bio")%></p>
                                                    <br />

                                                    <li class="btn btn-ctm" runat="server" id="login"><a href="/ViewProfile.aspx/<%# Eval("firstName") %><%# Eval("lastName") %>?pID=<%# Eval("userID") %>" style="color: #000">Profile<i class="icon-user"></i></a></li>
                                                    <li class="btn btn-ctm" runat="server" id="Li1"><a href="/ViewPortfolio.aspx/<%# Eval("firstName") %><%# Eval("lastName") %>?pID=<%# Eval("userID") %>" style="color: #000">Portfolio <i class="icon-camera"></i></a></li>
                                                    <button type="button" class="btn btn-ctm" data-toggle="modal" data-target="#myBio">Bio <i class="icon-lock"></i></button>
                                                    <button type="button" class="btn btn-ctm" data-toggle="modal" data-target="#myPassword">Password <i class="icon-lock"></i></button>


                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <span class="smalltri">

                                        <i class="icon-head"></i>
                                    </span>
                                </section>
                                <section class="section2 clearfix">
                                </section>
                            </div>

                        </ItemTemplate>
                    </asp:FormView>

                </div>
            </div>

            <%-- profile photo row--%>



            <div class="container">

                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading" style="margin-bottom: 0">
                        <h2>Profile Images</h2>

                    </div>
                </div>

                <div class="row animate-box" style="padding-top: 3.5em; padding-bottom: 3.5em; text-align: center">


                    <asp:FormView ID="profRepeater" runat="server" Style="width: 100%" DataSourceID="EDS_photos">

                        <ItemTemplate>


                            <div class="col-md-3 col-xs-12 col-sm-12">

                                <a href='<%# Eval("photo1") %>' class="port-photo image-popup" style='background-image: url(<%# Eval("photo1") %>)'>
                                    <img class="port-photo " style='background-image: url(<%# Eval("photo1") %>)'>
                                </a>
                                <button type="button" class="btn btn-ctm" data-toggle="modal" data-target="#confirm-logout">Update Photo 1</button>

                            </div>



                            <div class="col-md-3 col-xs-12 col-sm-12">

                                <a href='<%# Eval("photo2") %>' class="port-photo image-popup" style='background-image: url(<%# Eval("photo2") %>)'>
                                    <img class="port-photo " style='background-image: url(<%# Eval("photo2") %>)'>
                                </a>
                                <button type="button" class="btn btn-ctm" data-toggle="modal" data-target="#myProf2">Update Photo 2</button>

                            </div>


                            <div class="col-md-3 col-xs-12 col-sm-12">



                                <a href='<%# Eval("photo3") %>' class="port-photo image-popup" style='background-image: url(<%# Eval("photo3") %>)'>
                                    <img class="port-photo " style='background-image: url(<%# Eval("photo3") %>)'>
                                </a>
                                <button type="button" class="btn btn-ctm" data-toggle="modal" data-target="#myProf3">Update Photo 3</button>


                            </div>


                            <div class="col-md-3 col-xs-12 col-sm-12">
                                <a href='<%# Eval("photo4") %>' class="port-photo image-popup" style='background-image: url(<%# Eval("photo4") %>)'>
                                    <img class="port-photo " style='background-image: url(<%# Eval("photo4") %>)'>
                                </a>
                                <button type="button" class="btn btn-ctm" data-toggle="modal" data-target="#myProf4">Update Photo 4</button>
                            </div>

                        </ItemTemplate>
                    </asp:FormView>

                </div>
            </div>
            <%--profile photo end--%>
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading" style="margin-bottom: 0">
                    <h2>Porfolio Images</h2>

                </div>
            </div>

            <div class="row  animate-box" style="padding: 3.5em">
                <%-- <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Update Portfolio</button>--%>

                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="EDS_portfolio" OnItemCommand="Repeater2_ItemCommand">

                    <ItemTemplate>
                        <div class="col-md-3 col-xs-12 col-sm-12" style="text-align: center">
                            <a href='<%# Eval("image") %>' class="port-photo image-popup" style='background-image: url(<%# Eval("image") %>)'>
                                <img class="port-photo " style='background-image: url(<%# Eval("image") %>)'>
                            </a>
                            <asp:LinkButton ID="LinkButton1" runat="server" AutoPostback="false" CssClass=" btn btn-ctm" Style="width: 50%; text-decoration: none" Text="Like" CommandArgument='<%#Eval("portfolioID") %>' CausesValidation="false">Delete</asp:LinkButton>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>


            </div>





            <div class="row">
            </div>


        </div>
    </div>


    <%-- update portfolio modal--%>

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="text-align: center">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" id="accModal">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update Portfolio Photo</h4>
                    <br />

                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8" style="text-align: center">

                            <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" onchange="ShowImagePreview(this);" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <asp:Image ID="ImgPrv" Height="300px" Width="300px" class="img-responsive" runat="server" />
                            <asp:Button ID="Button1" runat="server" Text="Update Portfolio" UseSubmitBehavior="false" OnClick="BtnPortFolio_Click" />
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <%--  update portfolio end--%>
</asp:Content>

