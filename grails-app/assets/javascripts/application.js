if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });
    })(jQuery);
}
function changeVisibility(visibility, id, panelName) {
    $.ajax({
        url: "/topic/update",
        data: {"id": id, "visibility": visibility},
        method: "POST",
        success: function (data) {
            var response = data.message;
            if (response == "Success") {
                if (panelName == "trendingTopics") {
                    loadTrendingTopics(function () {
                        $("#responseMessage").attr("class", "alert alert-success").show();
                        $("#responseMessage > .visibilityText").text(response);
                    })
                    loadSubscription();
                }
                else if (panelName == "createdTopics") {
                    loadCreatedTopics(function () {
                        $("#responseMessage").attr("class", "alert alert-success").show();
                        $("#responseMessage > .visibilityText").text(response);
                    })
                }
                else if (panelName == "subscription") {
                    loadSubscription(function () {
                        $("#responseMessageSubs").attr("class", "alert alert-success").show();
                        $("#responseMessageSubs > .visibilityText").text(response);
                    })
                    loadTrendingTopics();
                }
            }
            else {
                if (panelName == "subscription") {
                    loadSubscription(function () {
                        $("#responseMessageSubs").attr("class", "alert alert-success").show();
                        $("#responseMessageSubs > .visibilityText").text(response);
                    })
                }
                else {
                    $("#responseMessage").attr("class", "alert alert-danger").show();
                    $("#responseMessage > .visibilityText").text(response);
                }
            }

        },
        error: function (data) {
            if (panelName == "subscription") {
                loadSubscription(function () {
                    $("#responseMessageSubs").attr("class", "alert alert-success").show();
                    $("#responseMessageSubs > .visibilityText").text(response);
                })
            }
            else {
                $("#responseMessage").attr("class", "alert alert-danger").show();
                $("#responseMessage > .visibilityText").text(data.statusText);
            }
        }
    });
}
function changeSeriouness(seriousness, id, panelName) {
    var alertPanel = $("#alertPanel");
    $.ajax({
        url: "/subscription/update",
        data: {"id": id, "seriousness": seriousness},
        method: "POST",
        success: function (data) {
            var response = data.message
            if (response == "Success") {
                if (panelName == "trendingTopics") {
                    loadTrendingTopics(function () {
                        $("#responseMessage").attr("class", "alert alert-success").show();
                        $("#responseMessage > .visibilityText").text(response);
                    })
                    loadSubscription();
                }
                else if (panelName == "createdTopics") {
                    loadCreatedTopics(function () {
                        $("#responseMessage").attr("class", "alert alert-success").show();
                        $("#responseMessage > .visibilityText").text(response);
                    })
                }
                else if (panelName == "subscription") {
                    loadSubscription(function () {
                        $("#responseMessageSubs").attr("class", "alert alert-success").show();
                        $("#responseMessageSubs > .visibilityText").text(response);
                    })
                    loadTrendingTopics();
                }
                else {
                    $("#responseMessage").attr("class", "alert alert-success").show();
                    $("#responseMessage > .visibilityText").text(response);
                }
            }
            else {
                if (panelName == "subscription") {
                    loadSubscription(function () {
                        $("#responseMessageSubs").attr("class", "alert alert-success").show();
                        $("#responseMessageSubs > .visibilityText").text(response);
                    })
                }
                else {
                    $("#responseMessage").attr("class", "alert alert-danger").show();
                    $("#responseMessage > .visibilityText").text(response);
                }
            }

        },
        error: function (data) {
            if (panelName == "subscription") {
                loadSubscription(function () {
                    $("#responseMessageSubs").attr("class", "alert alert-success").show();
                    $("#responseMessageSubs > .visibilityText").text(response);
                })
            }
            else {
                $("#responseMessage").attr("class", "alert alert-danger").show();
                $("#responseMessage > .visibilityText").text(data.statusText);
            }
        }
    });
}
function loadTrendingTopics(callback) {
    console.log("This was called")
    $("#trendingTopicsSection").load("/user/loadTrendingTopics", function (data) {
        if (callback) {
            callback();
        }
    });
}
function loadInbox(callback) {
    $("#inboxSection").load("user/loadInbox", function (data) {
        if (callback) {
            callback();
        }
    })
}
function loadCreatedTopics(callback) {
    $("#createdTopicSection").load("/user/loadCreatedTopics", function (data) {
        if (callback) {
            callback();
        }
    });
}
function loadSubscription(callback) {
    console.log("This was called")
    $("#subscriptionPanel").load("/user/loadSubscription", function (data) {
        if (callback) {
            callback();
        }
    })
}
function loadUserTable() {
    $("#userTableSection").load("/user/loadUserTable")
}
function changePassword() {
    var password = $("#password").val();
    var confirm = $("#confirmPassword").val();
    $.ajax({
        url: "/user/updatePassword",
        data: {"password": password, "confirmPassword": confirm},
        method: "POST",
        success: function (data) {
            var response = data.message
            if (response == "Successfully Updated") {
                $("#responseMessagePassword").attr("class", "alert alert-success").show();
                $("#responseMessagePassword > .visibilityText").text(response);
                $("#password").val("")
                $("#confirmPassword").val("")
            }
            else {
                $("#responseMessagePassword").attr("class", "alert alert-danger").show();
                $("#responseMessagePassword > .visibilityText").text(response);
            }

        },
        error: function (data) {
            $("#responseMessagePassword").attr("class", "alert alert-danger").show();
            $("#responseMessagePassword > .visibilityText").text(data.statusText);
        }
    });
}
function deleteTopic(id, panelName) {
    $.ajax({
        url: "/topic/delete",
        data: {"id": id},
        method: "POST",
        success: function (data) {
            var response = data.message;
            if (response == "Deleted") {
                if (panelName == "trendingTopics") {
                    loadTrendingTopics(function () {
                        $("#responseMessage").attr("class", "alert alert-success").show();
                        $("#responseMessage > .visibilityText").text(response);
                    })
                    location.reload();
                }
                else if (panelName == "createdTopics") {
                    loadCreatedTopics(function () {
                        $("#responseMessage").attr("class", "alert alert-success").show();
                        $("#responseMessage > .visibilityText").text(response);
                    })
                    location.reload();
                }
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

