/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(this).ready(function(){
    
    //update colums names
    var tables = ["gallery","members","recipes"];
    var selectedTable = $("#tableName").val();
    for(var i = 0; i < tables.length; i++)
        if(selectedTable == tables[i])
            $("."+tables[i]).show();
        else
            $("."+tables[i]).hide();
    $("#columName").val($("."+selectedTable).val());
    
    //update disabled colums
     $("#operationCondition").val("");
    var selectedOperation = $("#operations").val();
    if(selectedOperation == "SELECT" || selectedOperation == "DELETE"){
        $("#columName").attr('disabled', 'disabled');
        $("#operationValue").attr('disabled', 'disabled');
    }
    else{
         $("#columName").removeAttr('disabled');
         $("#operationValue").removeAttr('disabled');
    }

});

//disable colum names for SELECT and DELETE functions
$("#operations").change(function(){
    $("#operationCondition").val("");
    var selectedOperation = $(this).val();
    if(selectedOperation == "SELECT" || selectedOperation == "DELETE"){
        $("#columName").attr('disabled', 'disabled');
        $("#operationValue").attr('disabled', 'disabled');
    }
    else{
         $("#columName").removeAttr('disabled');
         $("#operationValue").removeAttr('disabled');
    }
});

//dependet colum names
$("#tableName").change(function(){
    var tables = ["gallery","members","recipes"];
    var selectedTable = $(this).val();
    for(var i = 0; i < tables.length; i++)
        if(selectedTable == tables[i])
            $("."+tables[i]).show()
        else
            $("."+tables[i]).hide();
    
    $("#columName").val($("."+selectedTable).val());

});

//sql query submit listener
$("#AdminForm").submit(function (e) {
    e.preventDefault();
    AJAXAdmin();
});  //end of submit function

function AJAXAdmin(){
    var url = "AdminQuery";
    var customData = "operation="+$("#operations").val()+"&tableName="+$("#tableName").val()+"&columName="+$("#columName").val()+"&";
        $.ajax({
            type: "POST",
            url: url,
            data: customData+ $("#AdminForm").serialize(),
            success: function (raw)
            {
                $("#output").html("");
                var rows = raw.split(";");
                
                //check for sql error
                if(raw.contains("sql error")){
                    $("#sqlError").html("<h1> please make sure the condition is correct </h1>");
                    return;
                }
                else
                    $("#sqlError").html("");
                
                //check if database is empty
                if(rows.length == 2) {
                    $("#emptyTable").html("<h1> table " + $("#tableName").val() + " is empty!! </h1>");
                    return;
                } else
                    $("#emptyTable").html("");
                
                //generate output table
                $("#output").append("<tr><td colspan=" + (rows[0].split("|")).length + "> <h1> " + $("#tableName").val() + " </h1> </td> </tr>");
                for(var row = 0; row < rows.length - 1; row++){
                    var colums = rows[row].split("|");
                    var tr = "<tr>";
                    for(var col = 0; col < colums.length; col++){
                        if(col == 6){
                            //set steps
                            var step = "";
                            var steps = colums[6].split("&&");
                            for(var i = 0; i < steps.length; i++)
                            {
                                step += "step number " + i + ": " + steps[i] + "<br/> <hr/>";
                            }
                            tr += "<td>" + step + "</td>";
                            continue;
                        }
                        tr += "<td>" + colums[col] + "</td>";
                    }
                    tr += "</tr>";
                    $("#output").append(tr);
                
                }
            },
            error: function (var1, error)
            {
                alert(error);
            }
        });
}