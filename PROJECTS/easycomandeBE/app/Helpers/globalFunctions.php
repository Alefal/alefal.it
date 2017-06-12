<?php
/*
|--------------------------------------------------------------------------
| Global functions
|--------------------------------------------------------------------------
|
| Global functions for project
|
*/

/* ---------------------------------------------------------------------------
 * SORT FUNCTIONS
 * --------------------------------------------------------------------------- */
function sortFunction($a,$b){
    if ($a['start_time'] == $b['start_time']) return 0;
    return strtotime($a['start_time']) - strtotime($b['start_time']);
}

function sortTime($a,$b){
    if ($a['ora_inizio'] == $b['ora_inizio']) return 0;
    return strtotime($a['ora_inizio']) - strtotime($b['ora_inizio']);
}

function sortName($a,$b){
    return $a['id']<$b['id'];
}

function sortFullName($a,$b){
    return $a['titolo']<$b['titolo'];
}

function sortId($a, $b) {
    return strcmp($a['id'], $b['id']);
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: CATEGORIES
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseCategories($jsonData) {
    //$jsonData = str_replace("\\","", $jsonData);
    $categories = json_decode($jsonData, true);
    
    $json = '{ "results" : [';
    for ($i=0; $i<count($categories); $i++) {

        $descr =  stripslashes($categories[$i]['description']);

        $json .= '{';
        $json .= '"id":"'.$categories[$i]['id'].'",';
        $json .= '"name":"'.$categories[$i]['name'].'",';
        $json .= '"count":"'.$categories[$i]['count'].'",';
        $json .= '"description":"'.htmlspecialchars($descr).'"';
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: MENU
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseMenu($jsonData,$categories) {
    //$jsonData = str_replace("\\","", $jsonData);
    $menu = json_decode($jsonData, true);

    $category = '';
    
    $json = '{ "results" : [';
    for ($i=0; $i<count($menu); $i++) {

        for ($j=0; $j<count($categories); $j++) {
            if($menu[$i]['categories_id'] == $categories[$j]['id']) {
                $category = $categories[$j]['name'];
            }
        }
    
        $descr =  stripslashes($menu[$i]['description']);

        $json .= '{';
        $json .= '"id":"'.$menu[$i]['id'].'",';
        $json .= '"name":"'.$menu[$i]['name'].'",';
        $json .= '"price":"'.$menu[$i]['price'].'",';
        $json .= '"priceoffer":"'.$menu[$i]['priceoffer'].'",';
        $json .= '"category":"'.$category.'",';
        $json .= '"description":"'.htmlspecialchars($descr).'"';
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: ORDERS
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseOrders($jsonData,$states) {
    //$jsonData = str_replace("\\","", $jsonData);
    $orders = json_decode($jsonData, true);

    $state = '';
    
    $json = '{ "results" : [';
    for ($i=0; $i<count($orders); $i++) {

        for ($j=0; $j<count($states); $j++) {
            if($orders[$i]['state_id'] == $states[$j]['id']) {
                $state = $states[$j]['state'];
            }
        }
    
        $json .= '{';
        $json .= '"id":"'.$orders[$i]['id'].'",';
        $json .= '"date":"'.$orders[$i]['date'].'",';
        $json .= '"client":"'.$orders[$i]['client'].'",';
        $json .= '"totalorder":"'.$orders[$i]['totalorder'].'",';
        $json .= '"totalservice":"'.$orders[$i]['totalservice'].'",';
        $json .= '"state":"'.$state.'"';
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: MENU for CATEGORY
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseOrder($jsonData,$items,$notes) {
    //$jsonData = str_replace("\\","", $jsonData);
    $order = json_decode($jsonData, true);

    $json = '{ "results" : [';
    $json .= '{';
    $json .= '"id":"'.$order['id'].'",';
    $json .= '"date":"'.$order['date'].'",';
    $json .= '"client":"'.$order['client'].'",';
    $json .= '"totalorder":"'.$order['totalorder'].'",';
    $json .= '"totalservice":"'.$order['totalservice'].'",';

    $json .= '"items":[';
    for ($j=0; $j<count($items); $j++) {
        $json .= '{';

        $json .= '"name": "'.$items[$j]['menuname'].'",';
        $json .= '"quantity": "'.$items[$j]['quantity'].'",';
        $json .= '"total": "'.$items[$j]['total'].'",';
        $json .= '"service": "'.$items[$j]['service'].'",';
        $json .= '"note": "'.$items[$j]['note'].'",';
        $json .= '"state": "'.$items[$j]['statename'].'",';

        $json = rtrim($json,',');
        $json .= '},';
    }
    $json = rtrim($json,',');
    $json .= '],';

    $json .= '"notes":[';
    for ($j=0; $j<count($notes); $j++) {
        $json .= '{';

        $json .= '"note": "'.$items[$j]['note'].'",';

        $json = rtrim($json,',');
        $json .= '},';
    }
    $json = rtrim($json,',');
    $json .= ']';
    
    $json .='}';
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: MENU for CATEGORY
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseMenuForCategory($jsonData,$categories,$catId) {
    //$jsonData = str_replace("\\","", $jsonData);
    $menu = json_decode($jsonData, true);
    
    $category = '';
    for ($j=0; $j<count($categories); $j++) {
        if($catId == $categories[$j]['id']) {
            $category = $categories[$j]['name'];
        }
    }
    
    $json = '{ "results" : [';
    for ($i=0; $i<count($menu); $i++) {
        $descr =  stripslashes($menu[$i]['description']);

        $json .= '{';
        $json .= '"id":"'.$menu[$i]['id'].'",';
        $json .= '"name":"'.$menu[$i]['name'].'",';
        $json .= '"price":"'.$menu[$i]['price'].'",';
        $json .= '"priceoffer":"'.$menu[$i]['priceoffer'].'",';
        $json .= '"category":"'.$category.'",';
        $json .= '"description":"'.htmlspecialchars($descr).'"';
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: NOTES for ORDER
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseNotesForOrder($jsonData,$orders,$orderId) {
    //$jsonData = str_replace("\\","", $jsonData);
    $notes = json_decode($jsonData, true);
    
    $order = '';
    for ($j=0; $j<count($orders); $j++) {
        if($orderId == $orders[$j]['id']) {
            $order = $orders[$j]['client'];
        }
    }
    
    $json = '{ "results" : [';
    for ($i=0; $i<count($notes); $i++) {
        $json .= '{';
        $json .= '"id":"'.$notes[$i]['id'].'",';
        $json .= '"note":"'.$notes[$i]['note'].'",';
        $json .= '"order":"'.$order.'"';
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: EXTRA
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseExtra($jsonData) {
    //$jsonData = str_replace("\\","", $jsonData);
    $extra = json_decode($jsonData, true);

    $json = '{ "results" : [';
    for ($i=0; $i<count($extra); $i++) {

        $descr =  stripslashes($extra[$i]['description']);

        $json .= '{';
        $json .= '"id":"'.$extra[$i]['id'].'",';
        $json .= '"name":"'.$extra[$i]['name'].'",';
        $json .= '"price":"'.$extra[$i]['price'].'",';
        $json .= '"priceoffer":"'.$extra[$i]['priceoffer'].'",';
        $json .= '"description":"'.htmlspecialchars($descr).'"';
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: STATE
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseState($jsonData) {
    //$jsonData = str_replace("\\","", $jsonData);
    $state = json_decode($jsonData, true);

    $json = '{ "results" : [';
    for ($i=0; $i<count($state); $i++) {
        $json .= '{';
        $json .= '"id":"'.$state[$i]['id'].'",';
        $json .= '"name":"'.$state[$i]['name'].'"';
        
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}