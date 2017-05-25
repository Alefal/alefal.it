$(function () {
    $('.sidebar-toggle').bind('click', function (e) {
        console.log('sidebar-toggle');
        $('#sidebar').toggleClass('active');
        $('.app-container').toggleClass('__sidebar');
    });

    $('.navbar-toggle').bind('click', function (e) {
        console.log('navbar-toggle');
        
        $('#navbar').toggleClass('active');
        $('.app-container').toggleClass('__navbar');
    });
});