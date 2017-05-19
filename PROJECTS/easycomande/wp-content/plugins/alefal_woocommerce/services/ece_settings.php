<?php
require_once( '../lib/woocommerce-api.php' );

//DOCS: http://woocommerce.github.io/woocommerce-rest-api-docs/v3.html

//localhost CASA
//$store_url 			= 'http://localhost/alefal.it/PROJECTS/easycomande/';
//$consumer_key 		= 'ck_0b9e3dac9acbec2b13469eb6459a04b4cf711403';
//$consumer_secret 	= 'cs_3f3b5d53f2cf334391ea97cfec0e43871194ebc4';

//localhost 192.168.1.100
//$store_url 				= 'http://192.168.1.100/alefal.it/PROJECTS/easycomande/';
//$consumer_key 			= 'ck_45a880890f601e395c582b20c8846f55340ac755';
//$consumer_secret 		= 'cs_3a8c2b5fdf8e8edc0957fed07f221574cf9421a9';

//localhost UFFICIO
$store_url 				= 'http://localhost/alefal.it/PROJECTS/easycomande/';
$consumer_key 			= 'ck_c034a906180d1ecee3fe21726ce75696fc91d4e7';
$consumer_secret 		= 'cs_3045ffd9c7ab5a12460665d7850512c42923876f';

//$store_url 				= 'http://www.amalficoastapps.it/demo/easycomande/';
//$consumer_key 			= 'ck_6e8d84e8f5bf570139c2c6025333dac6b31291f0';
//$consumer_secret 		= 'cs_5e516c9aaf62a33dc9adc3cabb9ec058136c0229';

$options = array(
    'ssl_verify'    => false,
    'version' 		=> 'v3'
);