<?php
error_reporting(0);

require_once("../../../../../wp-config.php");	
global $wpdb;

$table = $_POST['export_table'];

$host 	= DB_HOST;
$user 	= DB_USER;
$pass 	= DB_PASSWORD;
$db 	= DB_NAME;

$link = mysql_connect($host, $user, $pass); 
mysql_select_db($db) or die(mysql_error());

$file = $_POST['export_filename'];

$output = "";
//$sql = mysql_query("SELECT * from $table");
$sql = mysql_query("SELECT * from $table") or die ('Error updating database: '.mysql_error());
$columns_total = mysql_num_fields($sql);

// Get The Field Name

for ($i = 0; $i < $columns_total; $i++) {
	$heading = mysql_field_name($sql, $i);
	$output .= '"'.$heading.'",';
}
$output .="\n";

// Get Records from the table

while ($row = mysql_fetch_array($sql)) {
	for ($i = 0; $i < $columns_total; $i++) {
		$output .='"'.$row["$i"].'",';
	}
	$output .="\n";
}

// Download the file

$filename = $file.".csv";
header('Content-type: application/csv');
header('Content-Disposition: attachment; filename='.$filename);

echo $output;
exit;

error_reporting(1);
?>