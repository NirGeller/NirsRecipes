/* 
 * js code for the gallery.jsp page goes here
 * 
 */

////PreLoad JS
//=============================================
//=============================================
generateGallery();

        

////AJAX
//=============================================
//=============================================



function generateGallery()
{
    //empty gallery
    $(".gallery").html("");
    //generate gallery
    $.ajax({
       type: "get",
       url:"getGallery",
       success: function(data)
       {
           var photoDatas = data.split(";");

           for(i = 0; i < photoDatas.length - 1; i++)
           {
               //photo data is [PhotoId, Photo-src,Photo Title]
               var photoData = photoDatas[i].split(',');
               var paramaters ='"' + photoData[0] + '","' + photoData[1] + '","' + photoData[2] + '"';
               var html = "<li id='image" + photoData[0] + "'><img class='pop' src='" + photoData[1] + "' alt='" + photoData[2] + "' onclick='popImageModal(" + paramaters + ")' /></li>";
               var $image = $(html);
               $(".gallery").append($image);
           }
       },
       error: function(error)
       {
           alert(error);
       }
    });
}

//delete the image with the corresponding src from DOM and database
function deleteImage(id, src)
{
    $.ajax({
        type: "get",
        url: "deleteImage",
        data: {src:src},
        success: function(data)
        {
            var deleted = true;
            if(data.contains("error:") && !data.contains("Build"))
            {
                message = data;
                var $Msg = $("<div class='alert alert-danger Alert'>" + message +"</div>");
                $('#mainAlerts').html($Msg);
                deleted = false;
            }
            else
            {
                var $Msg = $("<div class='alert alert-success Alert'>the image was deleted successfully</div>");
                $('#mainAlerts').html($Msg);
            }
            
            setTimeout(function () {
                //$errorMsg.remove();
                $Msg.slideUp(500, function () {
                    $(this).remove();
                });
            }, 3000);
            $("#imagemodal").modal('hide');
            //hide the deleted image till the page is refreshed
            if(deleted)
                $("#image"+id).css("display","none");
            
        },
        error: function (var1, error)
        {
            alert(error);
        }
    });
}

//GALLERY
//==============================================

//gallery pop up event
function popImageModal(id, src, title){
   $("#myModalLabel").html(title); //assign the lable of the photo
   $('#imagepreview').attr('src', src); // here asign the image to the modal when the user click the enlarge link
   $("#imagepreview").attr('class', id);
   $('#imagemodal').modal('show'); // imagemodal is the id attribute assigned to the bootstrap modal, then i use the show function
};

//delete photo via AJAX
$("#deleteImage").click(function(){
    
    deleteImage($("#imagepreview").attr("class"), $("#imagepreview").attr("src"));
    
});

//add photo modal event
$("#addPhoto").click(function(){
    $("#imageModal").modal("show");
});



//check if photo was selected
function checkPhoto()
{
    if($("#file").val() == "")
    {
        var $errorMsg = $("<div class='alert alert-danger' id='noUploadAlert'> please select a file </div>");
        $('#noUpload').append($errorMsg);
        setTimeout(function () {
            //$errorMsg.remove();
            $errorMsg.slideUp(500, function () {
                $(this).remove();
            });
        }, 2000);
        return false;
    }
    
    //check for image file
    var imageType= $("#file").val().split(".")[1];
    if(imageType != "jpg")
    {
        var $errorMsg = $("<div class='alert alert-danger' id='noUploadAlert'> please select a jpg photo </div>");
        $('#noUpload').append($errorMsg);
        setTimeout(function () {
            //$errorMsg.remove();
            $errorMsg.slideUp(500, function () {
                $(this).remove();
            });
        }, 2000);
        return false;
    }
    
    //check if photo already exists in database
    var duplicate = false;
    $.ajax({
        async: false,
        type: "POST",
        url: "imageExists",
        data: {file: $("#file").val()},
        success: function(data){
            if(data.contains("error"))
            {
              var $errorMsg = $("<div class='alert alert-danger' id='ImageExists'> photo with that name already exists </div>");
              $('#noUpload').append($errorMsg);
              setTimeout(function () {
                  //$errorMsg.remove();
                  $errorMsg.slideUp(500, function () {
                      $(this).remove();
                  });
              }, 2000);
              duplicate = true;
            }
        },
        error: function(){
            alert("we have an error");
        }
   });
   return !duplicate;
}
