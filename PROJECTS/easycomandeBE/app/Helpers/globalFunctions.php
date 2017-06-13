<?php
/*
|--------------------------------------------------------------------------
| Global functions
|--------------------------------------------------------------------------
|
| Global functions for project
|
*/

use App\State;

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

        $descr =  $categories[$i]['description'];

        $json .= '{';
        $json .= '"id":"'.$categories[$i]['id'].'",';
        $json .= '"name":"'.$categories[$i]['name'].'",';
        $json .= '"slug":"'.$categories[$i]['slug'].'",';
        $json .= '"count":"'.$categories[$i]['count'].'",';
        $json .= '"description":'.json_encode($descr,JSON_UNESCAPED_SLASHES).'';
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
            if($menu[$i]['category_id'] == $categories[$j]['id']) {
                $category       = $categories[$j]['name'];
                $category_slug  = $categories[$j]['slug'];
            }
        }
    
        $descr =  $menu[$i]['description'];

        $json .= '{';
        $json .= '"id":"'.$menu[$i]['id'].'",';
        $json .= '"name":"'.$menu[$i]['name'].'",';
        $json .= '"price":"'.$menu[$i]['price'].'",';
        $json .= '"priceoffer":"'.$menu[$i]['priceoffer'].'",';
        $json .= '"category":"'.$category.'",';
        $json .= '"category_slug":"'.$category_slug.'",';
        $json .= '"description":'.json_encode($descr,JSON_UNESCAPED_SLASHES).'';
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Manipulate Json Response: MENU for CATEGORY
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseOrder($jsonData,$items,$specials,$notes,$states) {
    //$jsonData = str_replace("\\","", $jsonData);
    $order = json_decode($jsonData, true);

    for ($j=0; $j<count($states); $j++) {
        if($order['state_id'] == $states[$j]['id']) {
            $state = $states[$j]['state'];
        }
    }

    $json = '{ "results" : [';
    $json .= '{';
    $json .= '"id":"'.$order['id'].'",';
    $json .= '"date":"'.$order['date'].'",';
    $json .= '"client":"'.$order['client'].'",';
    $json .= '"totalorder":"'.$order['totalorder'].'",';
    $json .= '"totalservice":"'.$order['totalservice'].'",';
    $json .= '"state":"'.$state.'",';

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

    $json .= '"specials":[';
    for ($j=0; $j<count($specials); $j++) {
        $json .= '{';

        $json .= '"name": "'.$specials[$j]['special'].'",';
        $json .= '"price": "'.$specials[$j]['price'].'",';
        $json .= '"note": "'.$specials[$j]['note'].'",';

        $json = rtrim($json,',');
        $json .= '},';
    }
    $json = rtrim($json,',');
    $json .= '],';

    $json .= '"notes":[';
    for ($j=0; $j<count($notes); $j++) {
        $json .= '{';

        $json .= '"note": "'.$notes[$j]['note'].'",';

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
            $category_slug  = $categories[$j]['slug'];
        }
    }
    
    $json = '{ "results" : [';
    for ($i=0; $i<count($menu); $i++) {
        $descr =  $menu[$i]['description'];

        $json .= '{';
        $json .= '"id":"'.$menu[$i]['id'].'",';
        $json .= '"name":"'.$menu[$i]['name'].'",';
        $json .= '"price":"'.$menu[$i]['price'].'",';
        $json .= '"priceoffer":"'.$menu[$i]['priceoffer'].'",';
        $json .= '"category":"'.$category.'",';
        $json .= '"category_slug":"'.$category_slug.'",';
        $json .= '"description":'.json_encode($descr,JSON_UNESCAPED_SLASHES).'';
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
 * Manipulate Json Response: SPECIALS for ORDER
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseSpecialsForOrder($jsonData,$orders,$orderId) {
    //$jsonData = str_replace("\\","", $jsonData);
    $specials = json_decode($jsonData, true);
    
    $order = '';
    for ($j=0; $j<count($orders); $j++) {
        if($orderId == $orders[$j]['id']) {
            $order = $orders[$j]['client'];
        }
    }
    
    $json = '{ "results" : [';
    for ($i=0; $i<count($specials); $i++) {
        $json .= '{';
        $json .= '"id":"'.$specials[$i]['id'].'",';
        $json .= '"special":"'.$specials[$i]['special'].'",';
        $json .= '"price":"'.$specials[$i]['price'].'",';
        $json .= '"order":"'.$order.'"';
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

        $descr =  $extra[$i]['description'];

        $json .= '{';
        $json .= '"id":"'.$extra[$i]['id'].'",';
        $json .= '"name":"'.$extra[$i]['name'].'",';
        $json .= '"price":"'.$extra[$i]['price'].'",';
        $json .= '"priceoffer":"'.$extra[$i]['priceoffer'].'",';
        $json .= '"description":'.json_encode($descr,JSON_UNESCAPED_SLASHES).'';
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
        $json .= '"name":"'.$state[$i]['state'].'"';
        
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Save: STATE -> /jsondata/save/state/{"state":"processing"}
 * --------------------------------------------------------------------------- */
function saveState($request) {
    $item = json_decode($request, true);
    
    $json = '{ "results" : [';

    try{
        $state = new State();
        $state->state = $item['state'];
        $state->save();

        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"success"';
        $json .='},';
    }
    catch(Exception $e){
        $json .= '{';
            $json .= '"operation":"error",';
            $json .= '"message":"'.$e->getMessage().'"';
        $json .='},';
    }

    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}