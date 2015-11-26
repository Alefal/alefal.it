<?php
require_once('../../../wp-config.php'); 
require_once('functions.php');

global $wpdb;
$table_name = 'alfl_register_device';

$resultArray = array();

if(isset($_GET['register_id']) && isset($_GET['register_model']) && isset($_GET['version_app'])) {
    $register_id 	= $_GET['register_id'];
    $register_model = $_GET['register_model'];
    $version_app = $_GET['version_app'];

    $results = $wpdb->get_results("SELECT * FROM $table_name WHERE registerId LIKE '$register_id'");

    if($results) {
        $wpdb->update( 
            $table_name, 
            array( 
                'registerId' => $register_id, 
                'registerModel' => $register_model, 
                'versionApp' => $version_app, 
            ),
            array( 
                'registerId' => $register_id 
            )  
        );
    } else {
        $wpdb->insert( 
            $table_name, 
            array( 
                'registerId' => $register_id, 
                'registerModel' => $register_model, 
                'versionApp' => $version_app,
            ) 
        );
    }

    $resultArray[] = array(
        'result'  => 'OK',
        'message' => 'OK'
    );

} else {
    $resultArray[] = array(
        'result'  => 'KO',
        'message' => 'Verificare i parametri'
    );
}

echo json_encode($resultArray);
exit();