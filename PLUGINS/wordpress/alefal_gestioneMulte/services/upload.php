<?php
header('Access-Control-Allow-Origin: *'); 

require_once('../../../../wp-config.php');

global $wpdb;
$table_name = 'p_verb';

//echo $_GET['id'];
//echo $_GET['ente'];
$target_dir = '../uploads/'.$_GET['ente'].'/';

//print_r($_FILES);  

if ($_FILES) {
  $imageCapture = $_FILES['file']['tmp_name'];

  $id         = $_GET['id'];
  $numImage   = $_GET['numImage'];

  $filePath = '';
  $imgVerb  = '';

  if($numImage == 0) {
    $filePath = 'FILE_PATH_IMG_VERB';
    $imgVerb  = 'IMG_VERB';
  } else if($numImage == 1) {
    $filePath = 'FILE_PATH_IMG1_VERB';
    $imgVerb  = 'IMG1_VERB';
  } else if($numImage == 2) {
    $filePath = 'FILE_PATH_IMG2_VERB';
    $imgVerb  = 'IMG2_VERB';
  } else {
    $filePath = 'FILE_PATH_IMG_VERB';
    $imgVerb  = 'IMG_VERB';
  }

  $items = $wpdb->get_results("SELECT * FROM $table_name WHERE ID LIKE '$id'");

  if($items) {
    $wpdb->update( 
      $table_name, 
      array( 
        $filePath => $id.'_image_'.$numImage.'.jpg',
        $imgVerb  => file_get_contents($imageCapture)
      ),
      array( 
        'ID' => $id  //WHERE
      )  
    );

    $target_file = $target_dir . $id.'_'.$numImage.'_'.basename($_FILES['file']['name']);
    move_uploaded_file($_FILES['file']['tmp_name'], $target_file);
  
    $resultArray[] = array(
      'result'  => 'OK',
      'message' => 'Aggiornamento eseguito'
    );
  }
}
