<%-- 
    Document   : Gallery
    Created on : Mar 11, 2016, 8:20:37 PM
    Author     : gelle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Carousel Template for Bootstrap</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/grid.css" rel="stylesheet">
        <link href="css/gallery.css" rel="stylesheet">
        <link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
  </head>
    <body>
        
        <!-- NAVigation BAR
        ================================================== -->
        <div  class="navbar-wrapper">
            <div class="container">
                <nav  id="myNavBar" class="nav navbar-inverse navbar-fixed-top">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar" >
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="index.jsp">
                                Cooking Made Easy
                            </a>
                        </div>    
                        <div id="mainNavBar" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="index.jsp"> Home </a></li>
                                <li class="active"><a href="Gallery.jsp">Gallery</a></li>
                                <li><a href="Recipes.jsp">Recipes</a></li>
                                <li><a data-toggle="modal" data-target="#contactModal" href="#" id="contactUs"  onClick="return false;"> Contact Us </a></li>

                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a id="profileLink" data-toggle="modal" data-target="#signUpModal" href='#' onClick="return false;"> <span class="glyphicon glyphicon-user"></span> Sign Up </a></li>
                                <li><a id="logInLink" data-toggle="modal" data-target="#LoginModal" href='#'><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>


            </div>
        </div>
        
        <div id="siteContent">
            <!-- alerts go here -->
            <div id="mainAlerts">

            </div>
            <!-- Sign Up modal
            ====================================== !-->
            <div id="signUpModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" data-dismiss="modal">&times</button> 
                            <h3 class="modal-title">Sign Up Here</h3>
                            <h4>& cook better and ever</h4>
                        </div>
                        <form class="form-horizontal" id="signUpForm">
                            <div class="modal-body">
                                <div class="form-group" id='signUpFormGroup' >
                                    <div id="emailholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label " for="email">Email:</label>
                                        </div>
                                        <div class="col-sm-7" id="emailholder">
                                            <input type="text" class="form-control" data-toggle="tooltip"  title="please enter a valid email" id="email" name="email" placeholder="example@walla.co.il">
                                        </div> 
                                    </div>

                                    <!-- scpacing -->
                                    <br />
                                    <br />
                                    <br />

                                    <div id="nameholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label" for="name">Name: </label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" data-toggle="tooltip"  title="please enter a valid name" id="name" name="name" placeholder="Enter name here">
                                        </div> 
                                    </div>

                                    <!-- scpacing -->
                                    <br />
                                    <br />
                                    <br />

                                    <div id="lastnameholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label" for="lastName">Last Name:</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" data-toggle="tooltip"  title="please enter a valid lastname" id="lastName" name="lastName" placeholder="Enter last name here">
                                        </div> 
                                    </div>

                                    <!-- scpacing -->
                                    <br />
                                    <br />
                                    <br />

                                    <div id="pwdholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label " for="pwd">Password:</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="password" class="form-control" data-toggle="tooltip"  title="please enter at least 6 digit long with one letter and one digit" id="pwd" name="pwd" placeholder="Enter password here">
                                        </div> 
                                    </div>

                                    <!-- scpacing -->
                                    <br />
                                    <br />
                                    <br />

                                    <div id="confirmholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label" for="Confirmpwd">Confirm Password:</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="password" class="form-control" data-toggle="tooltip"  title="please enter a matching password" id="confirmpwd" name="confirmpwd" placeholder="Confirm password here">
                                        </div> 
                                    </div>

                                    <div class="col-sm-4 col-xs-offset-4" id="checkBoxHolder">
                                        <label><input type="checkbox" id="rememberMe" name="rememberMe"> Remember me</label>
                                    </div> 
                                </div>
                            </div>
                            
                            <!-- Alerts go here -->
                            <div id="registerAlert">

                            </div>
                            
                            <div class="modal-footer center">
                                <input type="submit" class="btn btn-primary btn-lg  active" value="lets Cook!" />
                                <input type="reset" class="btn btn-primary btn-lg  active" value="reset" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Login modal
            ====================================== !-->
            <div id="LoginModal" class="modal fade" role="dialog">
                <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-header">
                               <div class="center">
                                    <button class="close" data-dismiss="modal">&times</button>
                                    <h3 class="modal-title">Login Here</h3>
                                    <h4>& cook better and ever</h4>
                                </div> 
                        </div>
                        <form class="form-horizontal" id="LoginForm">
                            <div class="modal-body">

                                <div class="form-group" id="LoginFormGroup">

                                    <div class="col-xs-6 col-xs-offset-3" id='emailholder'>
                                        <label class="control-label " for="email">Email:</label>
                                        <input type="text" class="form-control" data-toggle="tooltip"  title="please enter a valid email" id="email" name="email" placeholder="example@walla.co.il">
                                    </div> 

                                    <!-- scpacing -->
                                    <br />
                                    <br />
                                    <br />
                                    <br />

                                    <div class="col-xs-6 col-xs-offset-3" id="pwdholder">
                                        <label class="control-label " for="pwd">Password:</label>
                                        <input type="password" class="form-control" data-toggle="tooltip"  title="please enter a valid password" id="pwd" name="pwd" placeholder="Enter password here">
                                    </div>

                                    <div class="col-xs-6 col-xs-offset-3 checkbox">
                                        <label><input type="checkbox" id="rememberMe" name="rememberMe"> Remember me</label>
                                    </div> 
                                    <!-- scpacing -->
                                    <br />
                                    <br />
                                    <br /> 
                                </div>
                            </div>
                            
                            <div id="loginAlert">

                            </div>
                            
                            <div class="modal-footer center">
                                <input type="submit" class="btn btn-primary btn-lg  active" value='lets cook!' />
                                <input type="reset" class="btn btn-primary btn-lg  active" value="reset" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Contact modal
            ====================================== !-->
            <div id="contactModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" data-dismiss="modal">&times</button>
                            <h3 class="modal-title">Contact us  </h3>
                            <h4> we are nice :)</h4>
                        </div>
                        <form class="form-horizontal" id="contactForm">
                            <div class="modal-body">
                                <div class="form-group">
                                    <div id="emailholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label " for="email">Email:</label>
                                        </div>
                                        <div class="col-sm-7" id="emailholder">
                                            <input type="text" class="form-control" data-toggle="tooltip"  title="please enter a valid email" id="contactEmail" name="email" placeholder="example@walla.co.il">
                                        </div> 
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <div id="nameholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label" for="name">Name: </label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" data-toggle="tooltip"  title="please enter a valid name" id="contactName" name="name" placeholder="Enter name here">
                                        </div> 
                                    </div>
                                    <br />
                                    <br />
                                    <br />

                                    <div id="lastnameholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label" for="lastName">Last Name:</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" data-toggle="tooltip"  title="please enter a valid lastname" id="contactLastName" name="lastName" placeholder="Enter last name here">
                                        </div> 
                                    </div>

                                    <br />
                                    <br />
                                    <br />

                                    <div id="messageholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label " for="pwd">Message</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <textarea placeholder="write your message here" id="message" name="message" class="form-control" data-toggle="tooltip"  title="please enter a message"></textarea>
                                        </div> 
                                    </div>

                                    <br />
                                    <br />
                                </div>

                            </div>
                            <div class="modal-footer center">
                                <input type="submit" class="btn btn-primary btn-lg  active" value="Send Mail!" />
                                <input type="reset" class="btn btn-primary btn-lg  active" value="reset" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Gallery
            ====================================== !-->
            <div class="container gridContainer">
                <div class="gridHeader">
                    <h2 class="gridTitle"> The Gallery </h2>
                    
                    <div class="input-group stylish-input-group" id="searchField">
                        <input type="text" class="form-control"  placeholder="Search" >
                        <span class="input-group-addon">
                            <button type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>  
                        </span>
                    </div>
                </div>
                <hr>
                <div class="gridBody">
                    <ul class="grid" id="photoGallery">
                    </ul><!--end thumbnails -->
                    <br>
                    <hr>
                    
                </div>
                
                <div id="galleryAdmin" class="adminContent">
                        <h2 id="galleryTitle">
                            hey Admin whats up? <br>
                            you got the button over here if you want to add some photos
                        </h2>
                        <button class="btn btn-info" id="addPhoto">Add Photo </button>
                </div>
                
                <!-- FOOTER -->
                <footer>
                  <p class="pull-right"><a href="#">Back to top</a></p>
                  <p>&copy; Nir Geller. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
                </footer>

            <!-- image previewing -->
            <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Image preview</h4>
                  </div>
                  <div class="modal-body center ">
                    <img src="" id="imagepreview" >
                  </div>
                  <div class="modal-footer  adminContent" id="previewFooter">
                    <button type="button" class="btn btn-danger" id="deleteImage" >delete</button>
                  </div>
                </div>
              </div>
            </div>

            <!-- add photo modal -->
            <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add photo</h4>
                  </div>
                  <div class="modal-body center ">
                      <form   method="post" action="uploadFile" enctype="multipart/form-data" onsubmit="return checkPhoto()">

                        <div class="col-sm-4 allingLeft" >
                            <label class="control-label" for="name">Select file to upload </label>
                        </div>
                        <div class="col-sm-7 allingLeft">
                            <input  type="file" id="file" name="file"/>
                        </div> 

                        </br>
                        </br>
                        
                        <div class="col-sm-4" >
                            <label class="control-label" for="name">Select file's title </label>
                        </div>
                        
                        <div class="col-sm-7 allingLeft">
                            <input class="form-control" type="text" id="fileTitle" name="fileTitle"/>
                        </div> 
                          
                        <input type="hidden" name="Dir" value="Gallery"/>

                        <br/>
                        <br/>
                        <br/>
                        <div id="noUpload">
                        </div>
                        <input type="submit" value="Upload" />
                      </form>
                  </div>

                </div>
              </div>
            </div>
        </div>
    </div><!-- /.site content -->
    <!-- scripts -->
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/CustumJavaScript.js"></script>
    <script src="js/galleryJS.js"></script>
        
        
    </body>
</html>
