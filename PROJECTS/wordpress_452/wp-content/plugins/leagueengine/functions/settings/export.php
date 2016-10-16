<?php
error_reporting(0);
global $wpdb;
require_once("../../../../../wp-config.php");	
$table = $_POST['export_table'];
$host = DB_HOST;
$user = DB_USER;
$pass = DB_PASSWORD;
$db = DB_NAME;
$file = $_POST['export_filename'];

// Fetch Record from Database

$output = "";
$sql = mysql_query("SELECT * from $table");
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