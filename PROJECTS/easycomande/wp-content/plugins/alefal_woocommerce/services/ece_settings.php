<?php
require_once( '../lib/woocommerce-api.php' );

//DOCS: http://woocommerce.github.io/woocommerce-rest-api-docs/v3.html

//localhost CASA
$store_url 			= 'http://localhost/alefal.it/PROJECTS/easycomande/';
$consumer_key 		= 'ck_0b9e3dac9acbec2b13469eb6459a04b4cf711403';
$consumer_secret 	= 'cs_3f3b5d53f2cf334391ea97cfec0e43871194ebc4';

//localhost UFFICIO
//$store_url 			= 'http://localhost/alefal.it/PROJECTS/easycomande/';
//$consumer_key 		= 'ck_c5a4145cb458658a41b0bf3fd074cc8196433236';
//$consumer_secret 		= 'cs_cd8c7191843aefbba943b40621f09ffc3c68bc4f';

//$store_url 				= 'http://www.amalficoastapps.it/demo/easycomande/';
//$consumer_key 			= 'ck_6e8d84e8f5bf570139c2c6025333dac6b31291f0';
//$consumer_secret 		= 'cs_5e516c9aaf62a33dc9adc3cabb9ec058136c0229';

$options = array(
    'ssl_verify'    => false,
    'version' 		=> 'v3'
);