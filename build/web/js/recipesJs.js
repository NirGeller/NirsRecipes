/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
generateRecipes();
////generata recipes
//=============================================
//=============================================
function generateRecipes()
{
    $("#recipesGrid").html("");
    $.ajax({
        type:"get",
        async: false,
        url:"getRecipes",
        success: function(raw){
            var recipes = raw.split(";");
            for(var i = 0; i < recipes.length -1; i++)
            {
                //recipeData goes [id, title, src, desc, ETA, servings, steps]
                var recipeData = recipes[i].split("|");
                var element = "<li id='" + recipeData[0] + "' class='pop'> <h3>" + recipeData[1] + "</h3><hr><img src='" + recipeData[2] + "' alt='recipeImage' />";
                $("#recipesGrid").append(element);
            }

            
        },
        error: function(var1, error){
            alert(error);
        }
    });
}
////Modal JS
//=============================================
//=============================================
$(".pop").on("click",function() {
    
    $.ajax({
        type:"get",
        async: false,
        url:"getRecipe",
        data: {id:$(this).attr("id")},
        success: function(recipe){
            //recipeData goes [id, title, src, desc, ETA, servings, ingredients, steps]
            var recipeData = recipe.split("|");
            
            $("#recipeTitle").html(recipeData[1]);
            $("#recipeLogo").attr('src',recipeData[2]);
            $("#descriptionHeader").html(recipeData[3]);
            $("#descriptionHeader").append("<br /><br /><span class='glyphicon glyphicon-time'></span>  " + recipeData[4] + "  <br/>   <span class='glyphicon glyphicon-cutlery'></span>  " + recipeData[5] + " servings!");
            $("#ingredients").html(recipeData[6]);
            var steps = recipeData[7].split(",");
            for(var i = 0; i < steps.length; i++)
            {
                var step = "<div class='recipeText recipeHeaders'> <h3> step number " + (i + 1) + ": </h3> " + steps[i] + "</div>";
                $("#stepsContainer").html(step);
            }
            
        },
        error: function(var1, error){
            alert(error);
        }
    });
    $("#recipemodal").modal("show");
    
});



////Add Recipe
//=============================================
//=============================================

//check form input
function checkRecipeForm()
{
    //reset errors
    $('#recipeInputError').html("");
    
    //check if image was selected
    var imageName = $("#recipeImage").val();
    if(imageName == "")
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > please select a file </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }
    
    //check if the image is a png image
    if(!imageName.contains(".jpg"))
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > please select a jpg image </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }
    
    //check if recipe title is empty
    var title = $("#recipeTitleInput").val();
    if(title == "")
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > please pick a title </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }   
    
    //check if recipes title or recipes image name already exists
    var inUse = false;
    $.ajax({
        type:"get",
        async: false,
        url:"recipeExists",
        data: {title: title, src: imageName},
        success: function(data){
            if(data.contains("error:"))
            {
                var $errorMsg = $("<div class='alert alert-danger Alert' >" + data.split("error: ")[1] + "</div>");
                $('#recipeInputError').html($errorMsg);
                inUse = true;
            }
            
        },
        error: function(var1, error){
            alert(error);
        }
    });
    if(inUse)
        return false;
    
    //check if description is empty or contains illegal characters
    var description = $("#recipeDescriptionInput").val();
    if(description == "")
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > please add a short description </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    } 
    if(!checkIllegalCharacters(description))
        return false;
    
    //check preperation time
    var hours = $("#estimatedTimeInput").val().split(":")[0];
    var minutes= $("#estimatedTimeInput").val().split(":")[1];
    
    //check if only nubmer
    var reg = new RegExp('^\\d+$');
    if(!reg.test(hours) || !reg.test(minutes))
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > prepation time must be Hours:Minutes in numbers only </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }
    
    //check preperation time
    if(parseInt(hours) > 72 || parseInt(minutes) > 60)
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > prepation must me in HH:Minutes, when less then 48 hours and less then 60 minutes </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }
    
    //check number of servings
    var servings = $("#servingsInput").val();
    if(servings == "")
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > please add number of servings</div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }
    if(!reg.test(servings))
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > number of servings must contain numbers only </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }
    if(parseInt(servings) < 1)
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > the meal must at least be one serving </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }  
    
    //check steps
    var steps = $("#recipeStepsnInput").val();
    if(steps == "")
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > please add the steps needed in order to prepare the meal </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    } 
    if(!checkIllegalCharacters(steps))
        return false;
    
    return true;
}

function checkIllegalCharacters(data)
{
    if(data.contains('{') || data.contains('}') || data.contains('[') || data.contains(']') || data.contains('&'))
    {
        var $errorMsg = $("<div class='alert alert-danger Alert' > description or steps can't contain '[ , ] , { , } , &' </div>");
        $('#recipeInputError').html($errorMsg);
        return false;
    }
    return true;
}
//reset error on modal close
$("#addRecipemodal").on('hidden.bs.modal', function(){
    $('#recipeInputError').html("");
});