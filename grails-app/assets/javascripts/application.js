if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });
    })(jQuery);
}
function changeVisibility(visibility, id) {
    $.ajax({
        url: "/topic/update",
        data: {"id": id, "visibility": visibility},
        method: "POST",
        success: function (data) {
            var response = data.message
            if (response == "Success") {
                loadTrendingTopics(function(){
                    $("#responseMessage").attr("class", "alert alert-success").show();
                    $("#responseMessage > .visibilityText").text(response);
                })
            }
            else {
                $("#responseMessage").attr("class", "alert alert-danger").show();
                $("#responseMessage > .visibilityText").text(response);
            }

        },
        error: function (data) {
            $("#responseMessage").attr("class", "alert alert-danger").show();
            $("#responseMessage > .visibilityText").text(data.statusText);
        }
    });
}
function changeSeriouness(seriousness, id) {
    $.ajax({
        url: "/subscription/update",
        data: {"id": id, "seriousness": seriousness},
        method: "POST",
        success: function (data) {
            var response = data.message
            if (response == "Success") {
                loadTrendingTopics(function () {
                    $("#responseMessage").attr("class", "alert alert-success").show();
                    $("#responseMessage > .visibilityText").text(response);
                });
            }
            else {
                $("#responseMessage").attr("class", "alert alert-danger").show();
                $("#responseMessage > .visibilityText").text(response);
            }

        },
        error: function (data) {
            $("#responseMessage").attr("class", "alert alert-danger").show();
            $("#responseMessage > .visibilityText").text(data.statusText);
        }
    });
}

function loadTrendingTopics(callback) {
    $("#trendingTopicsSection").load("/user/loadTrendingTopics", function (data) {
        if (callback) {
            callback();
        }
    });
}
function loadInbox(callback){
    console.log("This function was called")
    $("#inboxSection").load("user/loadInbox",function(data){
        if(callback)
        {
            callback();
        }
    })
}
