<?php
header('Access-Control-Allow-Origin: *'); 

require_once('../../../../wp-config.php');

global $wpdb;
$table_name = 'p_verb';

echo $_GET['id'];
//print_r($_FILES);  

if ($_FILES) {
  $imageCapture = $_FILES['file']['tmp_name'];

  $id   = $_GET['id'];
  $items = $wpdb->get_results("SELECT * FROM $table_name WHERE ID LIKE '$id'");

  if($items) {
    $wpdb->update( 
      $table_name, 
      array( 
        'IMG_VERB' => file_get_contents($imageCapture)
      ),
      array( 
        'ID' => $id  //WHERE
      )  
    );

    $resultArray[] = array(
      'result'  => 'OK',
      'message' => 'Aggiornamento eseguito'
    );
  }
}
