
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
  </head>

  <body>
    <%
        Integer hitsCount = 
          (Integer)application.getAttribute("hitCounter");
        if( hitsCount ==null || hitsCount == 0 )
           hitsCount = 1;
        else
           hitsCount += 1;
        application.setAttribute("hitCounter", hitsCount);
        
        
     %>
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
                        <span class="navbar-brand">
                            Cooking Made Easy
                        </span>
                    </div>    
                    <div id="mainNavBar" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index.jsp"> Home </a></li>
                            <li><a href="Gallery.jsp">Gallery</a></li>
                            <li><a href="Recipes.jsp">Recipes</a></li>
                            <li><a data-toggle="modal" data-target="#contactModal" href="#" id="contactUs" onClick="return false;"> Contact Us </a></li>
                            <li><a href="Admin.jsp" class="adminContent">Admin Page</a></li>
                            <li><a href="#"><span> visits: <%= hitsCount %> </span></a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a id="profileLink" data-toggle="modal" data-target="#signUpModal" href='#' onClick="return false;"> <span class="glyphicon glyphicon-user"></span> Sign Up </a></li>
                            <li><a id="logInLink" data-toggle="modal" data-target="#LoginModal" href='#' ><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    
    <div id="siteContent">
        <!--alerts go here -->
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
                            <!-- alerts go here -->
                            <div id="registerAlert">

                            </div>
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
                            <div id="loginAlert">

                            </div>
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


        <!-- Carousel
        ================================================== -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img class="first-slide" src="Images/SlideImage1.jpg" alt="First slide">
              <div class="container" >
                <div class="carousel-caption">
                    <p><a class="btn btn-primary" href="Gallery.jsp">Click Me For More</a></p>
                </div>
              </div>
            </div>
            <div class="item">
              <img class="second-slide" src="Images/SlideImage3.jpg" alt="Second slide">
              <div class="container">
                <div class="carousel-caption">
                  <p><a class="btn btn-primary" href="Gallery.jsp">Click Me For More</a></p>
                </div>
              </div>
            </div>
            <div class="item">
              <img class="third-slide" src="Images/SlideImage4.jpg" alt="Third slide">
              <div class="container">
                <div class="carousel-caption">
                    <p><a class="btn btn-primary" href="Gallery.jsp">Click Me For More</a></p>
                </div>
              </div>
            </div>
          </div>
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div><!-- /.carousel -->


        <!-- Marketing messaging and featurettes
        ================================================== -->
        <!-- Wrap the rest of the page in another container to center all the content. -->

        <div class="container marketing">

          <!-- Three columns of text below the carousel -->
          <div class="row">
            <div class="col-lg-4">
                <a href="#">
                    <img class="img-circle" src="Images/breakfast2.jpg" alt="Breakfast Icon" width="140" height="140">
                </a>
                <h2>BreakFast</h2>
                <p>"When you arise in the morning, think of what a precious privilege it is to be alive - to breathe, to think, to enjoy, to love." <br> <br> well that's cool and all, but we all know that a tasty breakfast counts the most</p>
                <p><a class="btn btn-default" href="Recipes.jsp" role="button">Tasty stuff awaits &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
              <img class="img-circle" src="Images/lunch.jpg" alt="Lunch Icon" width="140" height="140">
              <h2>Lunch It Is</h2>
              <p>"Ask not what can you do for your country, but whats for lunch?" <br> <br> well in our case it more "whats cooking today?"</p>
              <p><a class="btn btn-default" href="Recipes.jsp" role="button">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
              <img class="img-circle" src="Images/supper.jpg" alt="Supper Icon" width="140" height="140">
              <h2>Dinner for Last</h2>
              <p>"Eat breakfast like a king, Lunch like a prince and Dinner like a pauper" <br> <br> yeah yeah we know... no eating after 8 O'clock.. well that depends on whats cooking over there </p>
              <p><a class="btn btn-default" href="Recipes.jsp" role="button">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
          </div><!-- /.row -->


          <!-- START THE FEATURETTES -->

          <hr class="featurette-divider">

          <div class="row featurette">
            <div class="col-md-7">
              <h2 class="featurette-heading">Dinner for Last <span class="text-muted">It'll blow your mind.</span></h2>
              <p class="lead">Dinner usually refers to the most significant and important meal of the day, which can be the noon or the evening meal. However, the term "dinner" can have many different meanings depending on the culture; it may mean a meal of any size eaten at any time of day. Historically, it referred to the first meal of the day, eaten around noon, and is still sometimes used for a noontime meal, particularly if it is a large or main meal. The meaning as the evening meal, generally the largest of the day, is becoming standard in many parts of the English-speaking world.</p>
            </div>
            <div class="col-md-5">
                <img class="featurette-image img-responsive center-block" src="Images/amazingFood.jpg" alt="Generic placeholder image">
            </div>
          </div>

          <hr class="featurette-divider">

          <div class="row featurette">
            <div class="col-md-7 col-md-push-5">
              <h2 class="featurette-heading">food is the best. <span class="text-muted">but be careful of what you eat.</span></h2>
              <p class="lead">Food poisoning is when someone gets sick from eating food or drink that has gone bad or is contaminated. There are two kinds of food poisoning: poisoning by toxic agent or by infectious agent. Food infection is when the food contains bacteria or other microbes which infect the body after it is eaten. Food intoxication is when the food contains toxins, including bacterially produced exotoxins, which can happen even when the microbe that produced the toxin is no longer present or able to cause infection. Even though it is commonly called "food poisoning", most cases are caused by a variety of pathogenic bacteria, viruses, prions or parasites that contaminate food, rather than chemical or natural toxins which are what we usually call poison. According to the Centers for Disease Control and Prevention, about 76 million people in the United States become ill from the food they eat, and about 5,000 of them die every year</p>
            </div>
            <div class="col-md-5 col-md-pull-7">
              <img class="featurette-image img-responsive center-block" src="Images/doctor.jpg" alt="Generic placeholder image">
            </div>
          </div>

          <hr class="featurette-divider">

          <!-- /END THE FEATURETTES -->


          <!-- FOOTER -->
          <footer>
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&copy; Nir Geller. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
          </footer>

        </div><!-- /.container -->
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/CustumJavaScript.js"></script>
    
  </body>
</html>

