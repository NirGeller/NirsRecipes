//Close navbar on mobile
$('#toggle-register').on('click', 
    function()
    {
        $('#navbar').collapse('hide');
    });
    
$('#toggle-login').on('click', 
    function()
    {
        $('#navbar').collapse('hide');
    });

$('#register-form').submit(
    function (e)
        {
            //Conver the dataArray into a usable array
            var postArray = $('form#register-form').serializeArray();
            len = postArray.length;
            postdata = {};
            for (i=0; i<len; i++)
                {
                    postdata[postArray[i].name] = postArray[i].value;
                }
            if (validateRegister(postdata))
                {
                    $.post("register", $('form#register-form').serialize(),
                        function (data)
                        {
                            if (data === "Account Was Successfully Added!\n")
                                {
                                    $('#reset-register').click();
                                    $('#close-register').click();
                                    //Sucess alert
                                    $("#result").html('<div class="alert alert-success text-center"><button type="button" class="close">&times;</button>'+data+'</div>');
                                    window.setTimeout(
                                        function () 
                                        {
                                            $(".alert").fadeTo(500, 0).slideUp(500, 
                                                function () 
                                                    {
                                                        $(this).remove();
                                                        /*$.post("menu",
                                                            function(data)
                                                            {
                                                                logged(((String)data).split("&"));
                                                            });*/
                                                    });
                                        }, 5000);
                                    $('.alert .close').on("click", 
                                        function (e) 
                                        {
                                            $(this).parent().fadeTo(500, 0).slideUp(500);
                                        });

                                }
                            else
                                {
                                    //In case we weren't so successful...
                                    $('#register-error').html(data);
                                }
                        });
                }
            e.preventDefault();
        });

$('#login-form').submit(
    function (e){
    //Convert the dataArray into usable array
    var postArray = $('form#login-form').serializeArray();
            len = postArray.length;
            postdata = {};
            for (i=0; i<len; i++)
                {
                    postdata[postArray[i].name] = postArray[i].value;
                }
            if (validateLogin(postdata))
                {
                    $.post("login", $('form#login-form').serialize(),
                        function (data)
                        {
                            if (data === "Successfully Logged In!\n")
                                {
                                    $('#reset-login').click();
                                    $('#close-login').click();
                                    //Sucess alert
                                    $("#result").html('<div class="alert alert-success text-center"><button type="button" class="close">&times;</button>'+data+'</div>');
                                    window.setTimeout(
                                        function () 
                                        {
                                            $(".alert").fadeTo(500, 0).slideUp(500, 
                                                function () 
                                                    {
                                                        $(this).remove();
                                                        /*$.post("menu",
                                                            function(data)
                                                            {
                                                                logged(((String)data).split("&"));
                                                            });*/
                                                    });
                                        }, 5000);
                                    $('.alert .close').on("click", 
                                        function (e) 
                                        {
                                            $(this).parent().fadeTo(500, 0).slideUp(500);
                                        });
                                }
                            else
                                {
                                    //In case we weren't so successful...
                                    $('#login-error').html(data);
                                    if (data.contains("Name"))
                                        {
                                            $('input#login-uname').focus();
                                        }
                                    if (data.contains("Password"))
                                        {
                                            $('input#login-password').focus();
                                        }
                                }
                        });
                }
            e.preventDefault();
        });

//Inout validation functions 
function validateRegister(postdata)
{
    //Decalring strings for tests
    var base = "abcdefghijklmnopqrstuvwxyz";
    var upperbase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var numbers = "0123456789";
    
    //Fetching request data
    var uname = postdata["uname"];
    var gender = postdata["gender"];
    var email = postdata["email"];
    var cemail = postdata["cemail"];   
    var pwd = postdata["password"];
    var cpwd = postdata["cpassword"];

    
    //Checking User Name
    if (uname.length < 5)
        {
            $('input#register-uname').focus();
            $('#register-error').html("Username Must Be 5 Characters Or Longer!");
            return false;
        }
    
    //Checking gender
    if (gender!=="m" && gender!=="f")
        {
            $('#register-error').html("Please Select A Gender!");
            return false;
        }
    
    //Checking Email
    if (email.indexOf("@") === -1 || email.lastIndexOf(".") === email.length-1 || email.lastIndexOf(".") < email.indexOf("@"))
        {
            $('input#register-email').focus();
            $('#register-error').html("Please Enter A Valid Email Address!");
            return false;
        }

    //Checking email confirmation
    if (cemail !== email)
        {
            $('input#register-cemail').focus();
            $('#register-error').html("Email Doesn't Match!");
            return false;
        }
    
    //Checking password
    if (pwd.length < 8)
        {
            $('input#register-password').focus();
            $('#register-error').html("Password Must Be 8 Characters Or Longer!");
            return false;
        }
        
    if (pwd.length > 51)
        {
            $('input#register-password').focus();
            $('#register-error').html("Password Must Be 51 Characters Or Shorter!");
            return false;
        }

    for (i = 0; i < pwd.length; i++)  //Contains lower case
        {
            if (base.indexOf(pwd[i]) !== -1)
                {
                    break;
                }
            if (i === pwd.length-1)
                {
                    $('input#register-password').focus();
                    $('#register-error').html("Password Must Contain At Least One Lower Case Letter!");
                    return false;
                }
        }

    for (i = 0; i < pwd.length; i++)  //Contains upper case
        {
            if (upperbase.indexOf(pwd[i]) !== -1)
                {
                    break;
                }
            if (i === pwd.length-1)
                {
                    $('input#register-password').focus();
                    $('#register-error').html("Password Must Contain At Least One Upper Case Letter!");
                    return false;
                }
        }

    for (i = 0; i < pwd.length; i++)  //Contains numbers
        {
            if (numbers.indexOf(pwd[i]) !== -1)
                {
                    break;
                }
            if (i === pwd.length-1)
                {
                    $('input#register-assword').focus();
                    $('#register-error').html("Password Must Contain At Least One Number!");
                    return false;
                }
        }

    if (pwd !== cpwd)
        {
            $('input#register-cpassword').focus();
            $('#register-error').html("Password Doesn't Match!");
            return false;
        }
    
    return true;
}

function validateLogin(postdata)
{
    var pwd = postdata["password"];
    if (pwd.length > 51)
        {
            $('input#login-password').focus();
            $('#login-error').html("Password Is Too Long!");
            return false;
        }
    return true;
}

function logged(jsout)
{
    $('#member').html(jsout[0]);
    $('#toggle-login').html(jsout[1]);
    $('#toggle-register').html(jsout[2]);
}