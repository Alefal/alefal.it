$(function(){
    $('.sidebar-toggle').click(function() {
        if($('.app-sidebar').is(':visible')) {
            $('.app-sidebar').css('transform','translate(-100%, 0)');
            $('.app-sidebar').hide();
        } else {
            $('.app-sidebar').css('transform','translate(0, 0)');
            $('.app-sidebar').show();
        }
    });
});