<?php
require_once( '../lib/woocommerce-api.php' );

//DOCS: http://woocommerce.github.io/woocommerce-rest-api-docs/v3.html

//localhost CASA
$store_url 			= 'http://localhost/alefal.it/PROJECTS/ece/';
$consumer_key 		= 'ck_44f2cf4751aaa1d57757c4fd04cc83111a3ab6a2';
$consumer_secret 		= 'cs_04d7751de0776ce5f6e414ff44b49e5d1e64922d';

//localhost UFFICIO
//$store_url 			= 'http://localhost/alefal.it/PROJECTS/ece/';
//$consumer_key 		= 'ck_c5a4145cb458658a41b0bf3fd074cc8196433236';
//$consumer_secret 		= 'cs_cd8c7191843aefbba943b40621f09ffc3c68bc4f';

//$store_url 				= 'http://www.amalficoastapps.it/demo/ece/';
//$consumer_key 			= 'ck_7d075455871be3fe4413dc124a4a1a786d61cc91';
//$consumer_secret 		= 'cs_0a4d18ef4ac80101c6b0ac04da343bb4daf1d95c';

$options = array(
    'ssl_verify'    => false,
    'version' 		=> 'v3'
);