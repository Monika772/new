$(document).ready(function () {

       $.ajax({
        type: "get",
        url: "dashbord_data",
        success: function(response) {
            // var response =  JSON.stringify(response);
            jQuery.each(response, function( key, value) {
                console.log((value));


            });
        }
    });
});
