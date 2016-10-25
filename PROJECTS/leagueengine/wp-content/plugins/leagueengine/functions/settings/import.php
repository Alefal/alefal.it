<?php

function generateSeoTitle($title='') { //permalink generator      
 $title = strtolower($title);    $zio = array(  'Ì',  'Í',  'ß',  'ö',  'Ö',  ' ',   '(',   ')',   '%',   '+',   '&',   '.',   ',',   ':',   '/',   '?',   '’',   '"',   '“',   '”',   '–',   'À',   'È',   'É',   'Ù',   'Ú',   "'",   '"',  'ì',  'í',  'è',  'é',  'à',  'ù',  "'",  '"',  '!',  '#039;',  '&amp;',  'Ä',  'ä',  'ü',  'Ü',  'ò',  'ó',  'Ò',  'Ó',  'Á',  'á',  'ñ',  '’');   
 $ziosanato = array(  'i',  'i',  'ss',  'oe',  'oe',  '-',   '',   '',   '-',   '',   'e',   '',   '-',   '-',   '-',   '-',   '-',   '',   '',   '',   '-',   'a',   'e',   'e',   'u',   'u',   '-',   '',  'i',  'i',  'e',  'e',  'a',  'u',  "",  '',  '',  '-',  'e',  'a',  'a',  'u',  'u',  'o',  'o',  'o',  'o',  'a',  'a',  'gn',  '-');   
 $title = str_replace($zio,$ziosanato,$title);  $title = preg_replace('/[^a-zA-Z0-9_ \-()\/%-&]/s', '', $title);  
 $ogre = array('----','---','--');  
 $akuma = array('-','-','-');  
 $title = str_replace($ogre,$akuma,$title);     
 $title = preg_replace('/-$/', '', $title);      
 if (sizeof($title) > 0)      
 {          
 return $title;      }      
 else          
 return '';  } 


$upload_dir = wp_upload_dir();
$importdir  = $upload_dir['basedir']."/imported_csv/";
if(!is_dir($importdir))
{
        wp_mkdir_p($importdir);
}

// Global variable declaration
global $data_rows_pod;
$data_rows_pod = array();
global $headers_pod ;
$headers_pod = array();
global $defaults_pod;
global $wpdb;
global $keys_pod;
$keys_pod = array();
global $delim_pod;
global $posts_t_cat;
global $msql_table;
global $importop;

$importop = empty($_POST['importop']) ? '' : $_POST['importop'];
$tabella_msql = empty($_POST['tabella_msql']) ? '' : $_POST['tabella_msql'];
$posts_t_cat = empty($_POST['posts_t_cat']) ? '' : $_POST['posts_t_cat'];
$delim_pod = empty($_POST['delim']) ? '' : $_POST['delim'];
$tabella = empty($_POST['tabella']) ? '' : $_POST['tabella'];
//Columns from selected table
if (!empty($tabella)) {
$merde = $wpdb->get_results( "SHOW COLUMNS FROM ".$tabella,  ARRAY_A);
foreach($merde as $merda){
$keys_pod[$merda['Field']] = $merda['Field'];
}

$defaults_pod = array();
foreach($keys_pod as $val){
	$defaults_pod[$val]=$val;}
	
	
}

// CSV File Reader
function csv_file_data_pod($file,$delim_pod)
{
	ini_set("auto_detect_line_endings", true);
	global $data_rows_pod;
	global $headers_pod;
	global $delim_pod;
	
        $c = 0;
        $resource = fopen($file, 'r');
        while ($keys_pod = fgetcsv($resource,'',"$delim_pod",'"')) {
            if ($c == 0) { $headers_pod = $keys_pod;} 
                array_push($data_rows_pod, array_map('utf8_encode',$keys_pod));
            
            $c ++;
        }
        fclose($resource);
	ini_set("auto_detect_line_endings", false);
}

// Move file
function move_file_pod()
{
    
    $upload_dir = wp_upload_dir();
    $uploads_dir  = $upload_dir['basedir']."/imported_csv/";
    if ($_FILES["csv_import"]["error"] == 0) {
        $tmp_name = $_FILES["csv_import"]["tmp_name"];
        $name = $_FILES["csv_import"]["name"];
        move_uploaded_file($tmp_name, "$uploads_dir/$name");
    }
}

// Remove file
function fileDeletePod($filepath,$filename) {
	$success = FALSE;
	if (file_exists($filepath.$filename)&&$filename!=""&&$filename!="n/a") {
		unlink ($filepath.$filename);
		$success = TRUE;
	}
	return $success;	
}

?>
