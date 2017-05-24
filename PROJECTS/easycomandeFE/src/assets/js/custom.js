$(function(){

    //$(document).off('.data-api');

    $('.sidebar-toggle').click(function() {
        if($('.app-sidebar').is(':visible')) {
            $('.app-sidebar').css('transform','translate(-100%, 0)');
            $('.app-sidebar').hide();
        } else {
            $('.app-sidebar').css('transform','translate(0, 0)');
            $('.app-sidebar').show();
        }
    });

    //$('[data-toggle="popover"]').popover();
    //$('.popup').popover();
});