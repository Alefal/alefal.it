var $ = jQuery.noConflict();

$(document).ready(function($) {
	"use strict";
	
	//Preloader
	$(window).load(function(){
		$('.preloader').fadeOut('slow',function(){$(this).remove();});
	});
	
	//language Select
	 $('.language-dropdown').on('click', '.language-change a', function(ev) {
        if ("#" === $(this).attr('href')) {
            ev.preventDefault();
            var parent = $(this).parents('.language-dropdown');
            parent.find('.change-text').html($(this).html());
        }
    });
	
	// Search
	$('.fa-search').on('click', function() {
		$('.field-toggle').slideToggle(200);
	});
	
	// Slider Height
	var slideHeight = $(window).height();
	$('#main-carousel .item').css('height',slideHeight);

	$(window).resize(function(){'use strict',
		$('#main-carousel .item').css('height',slideHeight);
	});
	
	//Menu Toggle
	function menuToggle()
	{
		var windowWidth = $(window).width();

		var checkUrl = window.location.pathname+''+window.location.search;
		console.log('checkUrl: '+checkUrl);

		if ( checkUrl == '/' 
				|| checkUrl == '/index.php' 
				|| checkUrl == '/alefal.it/PROJECTS/minoresinelmondo.it/CMS/'
				|| checkUrl == '/alefal.it/PROJECTS/minoresinelmondo.it/CMS/?s=') {

			if(windowWidth > 767 ){
				$(window).on('scroll', function(){
					if( $(window).scrollTop()>405 ){
						$('.navbar').addClass('navbar-fixed-top animated fadeIn');
						$('.navbar').removeClass('main-nav');
					} else {
						$('.navbar').removeClass('navbar-fixed-top');
						$('.navbar').addClass('main-nav');
					}
				});
			}else{			
				$('.navbar').addClass('navbar-fixed-top');	
				$('.navbar').removeClass('main-nav');
			};
			if(windowWidth > 767 ){
				$(window).on('scroll', function(){
					if( $(window).scrollTop()>405 ){
						$('.top-bar').addClass('top-bar-hide');
					} else {
						$('.top-bar').removeClass('top-bar-hide');
					}
				});
			}else{			
				$('.top-bar').addClass(this);				
			};
		} else {
			$('.navbar').addClass('navbar-fixed-top animated fadeIn');
			$('.navbar').removeClass('main-nav');
		}
			
	}

	menuToggle();	
	
	//Menu Scrolling
	$('.navbar-nav').onePageNav({
		currentClass: 'active',
		filter: ':not(.exclude)',
	});


	$('.navbar-nav li a').on('click', function(){
		console.log($(this).attr('title'));
		if($(this).attr('title') != 'Home') {
			$('html, body').animate({scrollTop: $(this.hash).offset().top -40}, 500);
			return false;
		}
	});

	$('.backToTopBtn').on('click', function(){
		$('html, body').animate({scrollTop: $(this.hash).offset().top -40}, 500);
		return false;
	});
	
	//Scrolling
	$('#tohash, #tohash1, #tohash2, #tohas3').on('click', function(){
		$('html, body').animate({scrollTop: $(this.hash).offset().top -75}, 1000);
		return false;
	});
	
	//Parallax Scrolling
	$(window).bind('load', function () {
		parallaxInit();						  
	});
	function parallaxInit() {				
		$("#video-section").parallax("50%", 0.3);
		$("#donations").parallax("50%", 0.3);
		$("#word-for-humanity").parallax("50%", 0.3);	
	}	
	parallaxInit();	
	
	// Progress Bar
	$.each($('div.progress-bar'),function(){
		$(this).css('width', $(this).attr('data-transition')+'%');
	});
	
	//Pretty Photo
	 $("a[data-gallery^='prettyPhoto']").prettyPhoto({
	  social_tools: false
	 });
	 
	//Event Carousel
	$('#event-carousel.carousel').carousel({
	  interval: 8000
	});
	
	$(document).ready(function () {
		$(".navbar-nav li a").click(function(event) {
			$(".navbar-collapse").collapse('hide');
		});

		var userLang = navigator.language || navigator.userLanguage; 
		if(getCookie('language') == '') {
			console.log('setCookie: '+userLang);
			setCookie('language', userLang, 365);
		}
	});
	
	//style-chooser
	var presets = $('.style-chooser ul li');

	$('.style-chooser .toggler').on('click', function(event){
		event.preventDefault();
		$(this).closest('.style-chooser').toggleClass('opened');
	});

	$('.style-chooser ul li a').on('click', function(event){
		event.preventDefault();
		presets.removeClass('active');
		$(this).parent().addClass('active');
		$('#css-preset').removeAttr('href').attr('href', 'assets/css/presets/preset' + $(this).parent().data('preset') + '.css');
	});	
	
});

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function changeLanguage(lang) {
	setCookie('language', lang, 365);
	location.reload();
}
