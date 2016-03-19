////PreLoad JS
//=============================================
//=============================================

//check if logged in:
//holds 0 if no one is logged in or the name of the user
username="";
var admin;
//check at the loadup of the page if someone is logged in

//fix the caurasel padding around the navbar
fixPadding("#siteContent");
//wait for the document to load and then check user
$(document).ready(function(){
    updateLogin();
        
});

function updateLogin()
{
    updateUserName();
    if (username != "no user")
    {
        updateNavBar(username);
        $(".userId").html(getUserInfo()[1]);
        $(".userContent").css("display","block");
    }
    else
        $(".userContent").css("display","none");
}

//=============================================
//=============================================
//END PreLoad JS


////AJAX
//=============================================
//=============================================

//return username if logged in and 0 of not
function updateUserName()
{
    $.ajax({
        async: false,
        type: "POST",
        url: "SavedUser",
        success: function (data)
        {
            username = data;
            checkAdmin();
        },
        error: function (var1, error)
        {
            alert(error);
            return false;
        }
    });
}

//returns true if email is admins email
function checkAdmin()
{
    $.ajax({
        type:"post",
        url:"checkAdmin",
        data:{"email":username.split('\n')[0]},
        success: function(data)
        {
            if(data == "1")
                $(".adminContent").css("display","block");
            else
                $(".adminContent").css("display","none");
        },
        error: function(var1,error)
        {
            alert(error);
        }
    });
        
        
}

//submit the login form using ajax
function AJAXLogin(e)
{
    //check input
    if (!checkInput("#LoginModal"))
        return false;
    else
    {
        //ajax shit
        var url = "LogIn";
        $.ajax({
            type: "POST",
            url: url,
            data: $("#LoginForm").serialize(),
            success: function (data)
            {
                var $Msg;
                if (data.contains("error:"))
                {
                    var message = data.substr((data.indexOf(":") + 1));
                    $Msg = $("<div class='alert alert-danger Alert'> sry, " + message + " </div>");
                    $('#loginAlert').html($Msg);
                    setTimeout(function () {
                        //$errorMsg.remove();
                        $Msg.slideUp(500, function () {
                            $(this).remove();
                        });
                    }, 3000);
                }
                else
                {
                    updateLogin();
                    updateNavBar(data);
                    $("#LoginModal").modal('hide');
                }
                
            },
            error: function (var1, error)
            {
                alert(error);
            }
        });
        //end of ajax shit
    }
}

//submit the registration form using ajax
function AJAXRegister(e) {
    //check input
    if (!checkInput("#signUpModal"))
        return false;
    else
    {
        //ajax shit
        var url = "Registration";
        $.ajax({
            type: "POST",
            url: url,
            data: $("#signUpForm").serialize(),
            success: function (data)
            {

                if (data.contains("error:"))
                {
                    alert("test")
                    var message = data.split("error:")[1];
                    var $errorMsg = $("<div class='alert alert-danger Alert'> sry, " + message + " </div>");
                    $('#registerAlert').html($errorMsg);
                    setTimeout(function () {
                        $errorMsg.slideUp(500, function () {
                            $(this).remove();
                        });
                    }, 3000);
                }
                else
                {
                    var $successMsg = $("<div class='alert alert-success Alert'> Registration complete, you're now logged in </div>");
                    $('#mainAlerts').html($successMsg);
                    setTimeout(function () {
                        //$errorMsg.remove();
                        $successMsg.slideUp(500, function () {
                            $(this).remove();
                        });
                    }, 3000);
                    updateUserName();
                    updateNavBar(data);
                    $("#signUpModal").modal('hide');
                }
            },
            error: function (var1, error)
            {
                alert(error);
            }
        });
        //end of ajax shit
    }
}

//submit the contact form using ajax 
function AJAXContact(e){
    $.ajax({
        type: "get",
        url: "sendMail",
        data: $("#contactForm").serialize(),
        success: function(data)
        {
            var message = data;
            var $Msg;
            if(data.contains("error:"))
            {
                message = "sry, couldn't send the mail, contact us via phone please";
                $Msg = $("<div class='alert alert-danger Alert'>" + message +"</div>");
            }
            else
                $Msg = $("<div class='alert alert-success Alert'>" + message +"</div>");
            $('#mainAlerts').html($Msg);
            setTimeout(function () {
                //$errorMsg.remove();
                $Msg.slideUp(500, function () {
                    $(this).remove();
                });
            }, 3000);
            $("#contactModal").modal('hide');
            
        },
        error: function (var1, error)
        {
            alert(error);
        }
    });
}

function autoFillContact()
{
    //check if logged in
    var info = getUserInfo();
    $("#contactEmail").val(info[0]);
    $("#contactName").val(info[1]);
    $("#contactLastName").val(info[2]);
            
}

// returns [email, name, lastname]
function getUserInfo()
{
    
    if(username == "no user")
        return ["no user", "", ""];
    var output; 
    $.ajax({
            async: false,
            method:"post",
            url:"getUserInfo",
            data:{mail:username},
            //data is [name, lastname]
            success: function(data){
                
                var info = data.split(",");
                output = [username, info[0], info[1]];
                
            },
            error: function(var1, error)
            {
                alert(error);
            }

    });
    return output;
}




//============================================
//=============================================
//END AJAX

//NAVBAR
//=============================================
//=============================================


//display the user inforamtion after he logged in
function updateNavBar(username)
{
    //set the signup link
    $("#profileLink").html('<span class="glyphicon glyphicon-user"></span> <b>' + username + '</b>');
    $("#profileLink").attr("href", "Profile.jsp");
    $("#profileLink").removeAttr("data-toggle");
    $("#profileLink").removeAttr("data-target");

    //set the login link
    $("#logInLink").html('<span class="glyphicon glyphicon-log-in"></span> <b> Logout </b>');
    $("#logInLink").attr("href", "logOut");
    $("#logInLink").attr("accesskey", "1");
    $("#logInLink").removeAttr("data-toggle");
    $("#logInLink").removeAttr("data-target");
    $("#logInLink").attr("id", "logOutLink");

}

//============================================
//=============================================
//END NAVBAR

////Fix Padding
//=============================================
//=============================================
function fixPadding(item){
    $(item).css("margin-top", $("#myNavBar").outerHeight() + "px");
}

////FORMS
//=====================================================
//====================================================

//reset form on modal close                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     4
$('.modal').on('hidden.bs.modal', function () {
    $(this).find('form')[0].reset();
});

//Login submit listener
$("#LoginForm").submit(function (e) {
    e.preventDefault();
    AJAXLogin(e);
});  //end of submit function

//Register submit listener
$("#signUpForm").submit(function (e) {
    e.preventDefault();
    AJAXRegister(e);
});

//contact submit listener
$("#contactForm").submit(function (e) {
    e.preventDefault();
    AJAXContact(e);
});

//contact auto fill event
$('#contactUs').click(function(){
   autoFillContact();
});

//input checking
//==============================================

function checkInput(modal)
{
    //check mail
    if (!checkMail($(modal + ' #email').val()))
    {
        $(modal + ' #emailholder').addClass("has-error");
        $(modal + ' #email').tooltip("show");
        return false;
    } else {
        $(modal + ' #emailholder').removeClass("has-error");
        $(modal + ' #email').tooltip("destroy");
    }


    //check if modal is for login
    if (modal === "#LoginModal")
    {
        //check password
        var pwd = $(modal + ' #pwd').val();
        if (!checkPassword(pwd))
        {
            $(modal + ' #pwdholder').addClass("has-error");
            $(modal + ' #pwd').tooltip("show");
            return false;
        } else {
            $(modal + ' #pwdholder').removeClass("has-error");
            $(modal + ' #pwd').tooltip("destroy");
        }
        return true;
    }

    //check name
    if (!checkname($(modal + ' #name').val()))
    {
        $(modal + ' #nameholder').addClass("has-error");
        $(modal + ' #name').tooltip("show");
        return false;
    } else {
        $(modal + ' #nameholder').removeClass("has-error");
        $(modal + ' #name').tooltip("destroy");
    }

    //check last name
    if (!checkname($(modal + ' #lastName').val()))
    {
        $(modal + ' #lastnameholder').addClass("has-error");
        $(modal + ' #lastName').tooltip("show");
        return false;
    } else {
        $(modal + ' #lastnameholder').removeClass("has-error");
        $(modal + ' #lastName').tooltip("destroy");
    }



    //check if modal is for contact
    if (modal === "#contactModal")
    {
        //check message box
        if (($("#message").val()).length === 0)
        {
            $(modal + ' #messageholder').addClass("has-error");
            $(modal + ' #message').tooltip("show");
            return false;
        } else {
            $(modal + ' #messageholder').removeClass("has-error");
            $(modal + ' #message').tooltip("destroy");
        }
        return true;
    }

    //check password
    var pwd = $(modal + ' #pwd').val();
    if (!checkPassword(pwd))
    {
        $(modal + ' #pwdholder').addClass("has-error");
        $(modal + ' #pwd').tooltip("show");
        return false;
    } else {
        $(modal + ' #pwdholder').removeClass("has-error");
        $(modal + ' #pwd').tooltip("destroy");
    }

    //check if password match
    var pwd2 = $(modal + ' #confirmpwd').val();
    if (pwd !== pwd2)
    {

        $(modal + ' #confirmholder').addClass("has-error");
        $(modal + ' #confirmpwd').tooltip("show");
        return false;
    } else {
        $(modal + ' #confirmholder').removeClass("has-error");
        $(modal + ' #confirmpwd').tooltip("destroy");
    }
    return true;
}

function checkMail(mail)
{
    if (mail.length === 0)
        return false;
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(mail);
}

function checkPassword(pwd)
{
    if (pwd.length === 0)
        return false;
    var re = /^((?=.*\d)(?=.*[a-zA-Z]).{6,20})$/;
    return re.test(pwd);
}

function checkname(name)
{
    if (name.length === 0)
        return false;
    var re = /^(?=.*[a-zA-Z]).{2,20}$/;
    return re.test(name);
}

//============================================
//=============================================
//END Forms

