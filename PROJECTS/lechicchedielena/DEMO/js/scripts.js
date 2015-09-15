/* activate scrollspy menu */
$('body').scrollspy({
  target: '#navbar-collapsible',
  offset: 52
});

/* smooth scrolling sections */
$('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top - 50
        }, 800);
        
        if (this.hash=="#section1") {
            $('.scroll-up').hide();
        }
        else {
            $('.scroll-up').show();
        }
        
        
        // activte animations in this section
        target.find('.animate').delay(1200).addClass("animated");
        setTimeout(function(){
            target.find('.animated').removeClass("animated");
        },2000);
        
        return false;
      }
    }
});

var map;
function initialize() {
  var myLatlng = new google.maps.LatLng(40.650160,14.611770);
  var mapOptions = {
    zoom: 17,
    center: myLatlng,
    styles: [{
      stylers: [{
        saturation: -75
      }]
    }],
    mapTypeControl: false,
    zoomControl: false,
    scrollwheel: false,
    navigationControl: false,
    scaleControl: false
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  var image = 'img/gmap-marker.png';

  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'Le Chicche di Elena',
      icon: image
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

$(function () {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});