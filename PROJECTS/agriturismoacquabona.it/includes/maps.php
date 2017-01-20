<!--
KEY per agritursimoacquabona.it
-->
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false
    &amp;key=ABQIAAAAoa6ALZSzC0HKSOQIkw61FBTwGwEekFuas4NVkdlt12mQvTQdMRRvlLBhgH3Pn_qP_foOPZDTXcaSqA"
    type="text/javascript">
  </script>


<!-- KEY google che funziona per tutto localhost
<script src="http://maps.google.com/maps?file=api&v=2&sensor=true_or_false
    &key=ABQIAAAAoa6ALZSzC0HKSOQIkw61FBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRzx4DzsdFN2I-fPPYFt_t0bCoIew"
    type="text/javascript">
</script>
-->

<script type="text/javascript">

//<![CDATA[

function load() {
	try { 
		if (GBrowserIsCompatible()) {
			
			/* MAPPA STANDARD 
			var map = new GMap2(document.getElementById("map"));
			map.setCenter(new GLatLng(37.4419, -122.1419), 13);
			*/
			
			/* MAPPA CON MOVIMENTO 
			var map = new GMap2(document.getElementById("map"));
			map.setCenter(new GLatLng(37.4419, -122.1419), 13);
			window.setTimeout(function() {
				map.panTo(new GLatLng(37.4569, -122.1569));
			}, 1000);
			*/
			
			/* CONTROLLI SU MAPPA 
			var map = new GMap2(document.getElementById("map"));
			map.addControl(new GSmallMapControl());
			map.addControl(new GMapTypeControl());
			map.setCenter(new GLatLng(37.4419, -122.1419), 13);
			*/
			
			/* CATTURA LAT e LONG IN UN DIV 'MESSAGE' */
			var map = new GMap2(document.getElementById("map"));
			map.addControl(new GSmallMapControl());
			map.addControl(new GMapTypeControl());
			
			// Create our "tiny" marker icon
			var icon = new GIcon();
			icon.image = "<?php=IMG_MAPS?>";
			//icon.shadow = "http://labs.google.com/ridefinder/images/mm_20_shadow.png";
			icon.iconSize = new GSize(128, 31);
			//icon.shadowSize = new GSize(128, 31);
			icon.iconAnchor = new GPoint(0, 0);
			icon.infoWindowAnchor = new GPoint(0, 0);
			
			var x = 40.6491;
			var y = 14.6072;
			var point = new GLatLng(x,y);
							  
			map.setCenter(new GLatLng(x,y), 15);
			map.addOverlay(new GMarker(point,icon));
		}
	} catch(err) {
    	txt="There was an error on this page.\n\n"
        txt+="Error description: " + err.description + "\n\n"
        txt+="Click OK to continue.\n\n"
        alert(txt)
	} 
}

//]]>
</script>

<style>
	.bordino {
		border:solid 3px #406717;
	}
	#message {
		width:500px;
		font-family:Georgia, "Times New Roman", Times, serif;
		font-size:10px;
		padding-top:10px;
	}
</style>

<body onLoad="load()" onUnload="GUnload()">

<div id="map" style="width: 500px; height: 300px" class="bordino"></div>