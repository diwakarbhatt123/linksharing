if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
                $(this).fadeOut();
            });
    })(jQuery);
}
function changeVisibility(value,id)
{
	jQuery.post("/topic/update",{"id":id,"visibility":value},function(data,status){console.log(status)});
}
