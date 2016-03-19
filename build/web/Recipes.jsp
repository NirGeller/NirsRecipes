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
        <link href="css/recipes.css" rel="stylesheet">
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
                                <li><a href="Gallery.jsp">Gallery</a></li>
                                <li class="active"><a href="Recipes.jsp">Recipes</a></li>
                                <li><a data-toggle="modal" data-target="#contactModal" href="#" id="contactUs"  onClick="return false;"> Contact Us </a></li>

                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a id="profileLink" data-toggle="modal" data-target="#signUpModal" href='#'> <span class="glyphicon glyphicon-user"></span> Sign Up </a></li>
                                <li><a id="logInLink" data-toggle="modal" data-target="#LoginModal" href='#' ><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
            
            <!-- Recipes
            ====================================== !-->
            <div class="container gridContainer">
                <div class="gridHeader">
                    <h2 class="gridTitle"> Recipes, its all about recipes </h2>
                    
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
                    <ul class="grid" id="recipesGrid">
                        
                    </ul><!--end recipes -->
                    <br>
                    <hr>
                    
                </div>
                
                <!-- recipe previewing -->
                <div class="modal fade" id="recipemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                          <h2 class="modal-title" id="recipeTitle"></h2>
                        </div>
                        <div class="modal-body center ">
                            <div id="recipeImageContainer">
                              <img id="recipeLogo" src="">
                            </div>
                            
                            <div id="mealDescription">
                                <div id="descriptionHeader" class="recipeText recipeHeaders">
                                    <h3> A little bit about the meal: </h3>
                                </div> 
                            </div>
                            <div id="ingredientsContainer">
                              <div id="ingredientsHeader" class="recipeHeaders"> 
                                  <h3>you will need These: </h3>
                              </div>
                              <div id="ingredients" class="recipeText">
                              </div>
                            </div>
                            
                            <div id="stepsContainer">
                                
                            </div>
                        </div>
                        <div class="modal-footer specificUserContent" id="previewFooter">
                          <button type="button" class="btn btn-danger" id="deleteRecipe" >delete</button>
                        </div>
                    </div>
                  </div>
                </div>
                
                <!-- recipe adding -->
                <div class="modal fade" id="addRecipemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                          <h2 class="modal-title" id="addRecipeTitle">This Is Where It All Began</h2>
                        </div>
                        <form   method="post" action="saveRecipe" enctype="multipart/form-data" onsubmit="return checkRecipeForm()">
                            <div class="modal-body center " id="recipeDataContainer">
                                <!-- recipes image -->
                                <div class="col-sm-4 allingLeft inputLabel" >
                                <label class="control-label" for="name">Select recipes image </label>
                                </div>
                                <div class="col-sm-7 recipeInput">
                                    <input  type="file" id="recipeImage" name="recipeImage"/>
                                </div> 
                                
                                <!-- recipes title -->
                                <div class="col-sm-4 allingLeft inputLabel" >
                                    <label class="control-label" for="recipeTitleInput"> Recipes title </label>
                                </div>
                                <div class="col-sm-7 allingLeft recipeInput" >
                                    <input class="form-control" type="text" id="recipeTitleInput" maxlength="45" name="title" placeholder="i'm a title"/>
                                </div> 
                                
                                <!-- recipes description -->
                                <div class="col-sm-4 allingLeft inputLabel" >
                                    <label class="control-label" for="recipeDescriptionInput">Description </label>
                                </div>
                                <div class="col-sm-7 allingLeft recipeInput" >
                                    <textarea class="form-control" id="recipeDescriptionInput" maxlength="300" rows="5"  name="description" placeholder="enter recipe description here"></textarea>
                                </div>
                                
                                <!-- estamated time -->
                                <div class="col-sm-4 allingLeft inputLabel" >
                                    <label class="control-label" for="estimatedTimeInput">Estimated cooking time </label>
                                </div>
                                <div class="col-sm-7 allingLeft recipeInput" >
                                    <input class="form-control" type="text" id="estimatedTimeInput"  name="estimatedTime" placeholder="ETA in Hours:minues" />
                                </div> 
                                
                                <!-- servings -->
                                <div class="col-sm-4 allingLeft inputLabel" >
                                    <label class="control-label" for="servingsInput">Number of servings </label>
                                </div>
                                <div class="col-sm-7 allingLeft recipeInput" >
                                    <input class="form-control" type="text" id="servingsInput"  name="servings" placeholder="number of servings" />
                                </div> 
                                
                                <!-- ingredients -->
                                <div class="col-sm-4 allingLeft inputLabel" >
                                    <label class="control-label" for="ingredientsInput">ingredients </label>
                                </div>
                                <div class="col-sm-7 allingLeft recipeInput" >
                                    <textarea class="form-control" id="ingredientsInput" maxlength="300" rows="8" cols="10" name="ingredients" placeholder="enter ingredients that will be need for making this meal"></textarea>
                                </div>
                                
                                <!-- recipes steps -->
                                <div class="col-sm-4 allingLeft inputLabel" >
                                    <label class="control-label" for="recipeStepsnInput">Steps </label>
                                </div>
                                <div class="col-sm-7 allingLeft recipeInput" >
                                    <textarea class="form-control" id="recipeStepsnInput" maxlength="300" rows="8" cols="15" name="steps" placeholder="enter steps for making the meal here, please minimize the number of steps and each step should me in a seperate line!"></textarea>
                                </div>
                                
                                <input type="hidden" name="Dir" value="Recipes"/>
                                <input type="hidden" id="userNameInput" name="username" value=""/>
                                <br/>
                                
                                
                            </div>
                            <div class="modal-footer" id="previewFooter">
                                <!--error go here-->
                                <div id="recipeInputError">
                        
                                </div>
                                
                                <input type="submit" class="btn btn-info btn-primary"  value="Add Me" />
                                <input type="submit" class="btn btn-danger" value="Reset" />
                                
                            </div>
                        </form>
                        
                    </div>
                  </div>
                </div>
                <!-- user content -->
                <div id="galleryUser" class="userContent">
                        <h2>
                            hey <span class="userId"> </span> whats up? <br>
                            you got the button over here if you want to add some recipes
                        </h2>
                        <button class="btn btn-info" id="addRecipePop">Add Recipes </button>
                </div>

                 <!-- FOOTER -->
                <footer>
                    <p class="pull-right"><a href="#">Back to top</a></p>
                    <p>&copy; Nir Geller. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
                </footer>  
                
            </div><!-- /.gridContainer -->
            
            
            
        </div><!-- /.site content -->
        <!-- scripts -->
        <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="js/jquery.cookie.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/recipesJs.js"></script>
        <script src="js/CustumJavaScript.js"></script>
    </body>
</html>
