<%-- 
    Document   : AdminPage
    Created on : Apr 30, 2016, 5:05:35 PM
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
        <link href="css/admin.css" rel="stylesheet">
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
                                <li><a href="Gallery.jsp">Gallery</a></li>
                                <li><a href="Recipes.jsp">Recipes</a></li>
                                <li><a data-toggle="modal" data-target="#contactModal" href="#" id="contactUs"  onClick="return false;"> Contact Us </a></li>
                                <li class="active"><a href="Admin.jsp" class="adminContent">Admin Page</a></li>
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

                                    <div id="ageholder">
                                        <div class="col-sm-4" style="text-align: center">
                                            <label class="control-label" for="aeg">Age:</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" data-toggle="tooltip"  title="please enter a valid Age" id="age" name="age" placeholder="Enter Age here">
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
            
            <!--in case user isn't admin-->
            <div class="container notAdminContent" id="danger">
                <img src="Images/unauthorized.jpeg" alt="leave!" />
                <h1> you are not authorized to acces this page!!! </h1>
                <h2> please go back to the <a href="index.jsp"> home page </a> immediately!! </h2>
                
            </div>
            
            <!-- Admin Content
            ====================================== !-->
            <div class="container adminContent">
                <div class="header">
                    <h1> whats up <%= session.getAttribute("userInfo") %>? </h1>
                    <h2> ready to do things? </h2>
                    <hr>
                </div>
                <div id="management">
                    
                    <!--input section-->
                    <form id="AdminForm">
                        <table id="adminTable" border = 1>
                            <tr>
                                <th>
                                    <span>operation</span>
                                </th>
                                <th>
                                    <span>table name</span>
                                </th>
                                <th>
                                    <span>colum names</span>
                                </th>
                                <th>
                                    <span>new values(optional)</span>
                                </th>
                                <th>
                                    <span>condition(optional)</span>
                                </th>
                                <td>
                                    <input type="submit" class="btn btn-primary btn-lg  active" value="submit!" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <select id="operations" class="form-control">
                                        <option value="INSERT INTO">INSERT</option>
                                        <option value="DELETE">DELETE</option>
                                        <option value="SELECT">SELECT</option>
                                        <option value="UPDATE">UPDATE</option>
                                    </select> 
                                </td>
                                <td>
                                    <select id="tableName" class="form-control">
                                        <option value="gallery">gallery</option>
                                        <option value="members">members</option>
                                        <option value="recipes">recipes</option>
                                    </select>
                                </td>
                                <td>
                                    <select id="columName" class="form-control">
                                        <option value="*">all of the colums</option>
                                        
                                        <!--members-->
                                        <option class="members" value="first_name">first name</option>
                                        <option class="members" value="last_name">last name</option>
                                        <option class="members" value="age">age</option>
                                        <option class="members" value="email">email</option>
                                        <option class="members" value="pass">pass</option>
                                        <option class="members" value="regdate">registration date</option>
                                        
                                        <!--gallery-->
                                        <option class="gallery" value="src">source</option>
                                        <option class="gallery" value="title">image title</option>
                                        
                                        <!--recipes-->
                                        <option class="recipes" value="title">title</option>
                                        <option class="recipes" value="src">source</option>
                                        <option class="recipes" value="description">description</option>
                                        <option class="recipes" value="ETA">ETA</option>
                                        <option class="recipes" value="servings">servings</option>
                                        <option class="recipes" value="ingredients">ingredients</option>
                                        <option class="recipes" value="steps">steps</option>
                                        <option class="recipes" value="username">owner</option>
                                        
                                    </select>

                                </td>
                                <td>
                                    <input type="text" class="form-control" id="operationValue" name="operationValue" placeholder="Enter a Value">

                                </td>
                                <td>
                                    <input type="text" class="form-control" id="operationCondition" name="operationCondition" placeholder="Enter a Condition">

                                </td>
                                <td>
                                    <input type="reset" class="btn btn-danger btn-lg  active" value="reset !!" />                          
                                </td>
                            </tr>
                        </table>
                    </form>
                    
                    <!--spacing-->
                    <br/>
                    <br/>
                    <br/>
                    <!--output section-->
                    <h1> output </h1>
                    <hr>
                    
                    <table border = 1 id="output">
                        <!--output will go here-->
                    </table>
                    
                    <div id='sqlError'>
                        <!--sql errors go her-->
                    </div>
                    
                    <div id='emptyTable'>
                        <!--empty table notice goes here-->
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
    <script src="js/adminJS.js"></script>
    </body>
</html>

