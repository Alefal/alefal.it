<?php
header('Access-Control-Allow-Origin: *'); 

$target_dir = '../uploads/';

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
        'FILE_PATH_IMG_VERB' => $id.'_image.jpg',
        'IMG_VERB' => file_get_contents($imageCapture)
      ),
      array( 
        'ID' => $id  //WHERE
      )  
    );

    $target_file = $target_dir . $id.'_'.basename($_FILES['file']['name']);
    move_uploaded_file($_FILES['file']['tmp_name'], $target_file);
  
    $resultArray[] = array(
      'result'  => 'OK',
      'message' => 'Aggiornamento eseguito'
    );
  }
}
