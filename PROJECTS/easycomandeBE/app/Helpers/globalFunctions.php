<?php
/*
|--------------------------------------------------------------------------
| Global functions
|--------------------------------------------------------------------------
|
| Global functions for project
|
*/

use Illuminate\Support\Facades\Auth;

use App\Category;
use App\Menu;
use App\Order;
use App\Item;
use App\Special;
use App\Note;
use App\State;
use App\User;
use App\Notification;

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
 * Manipulate Json Response: AUTH
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseAuth($email,$password) {
    $users = User::all();
    $json = '';

    if (Auth::attempt(['email' => $email, 'password' => $password])) {
        $user = Auth::user();
        $json .= '{';
        $json .= '"logged":"autenticated",';
        $json .= '"user":"'.$user['email'].'",';
        $json .= '"name":"'.$user['name'].'"';
        $json .='}';
    } else {
        $json .= '{';
        $json .= '"logged":"failed"';
        $json .='}';
    }

    return $json;
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
function manipulateJsonResponseMenuForCategory($jsonData,$categories,$catId) {
    //$jsonData = str_replace("\\","", $jsonData);
    $menu = json_decode($jsonData, true);
    
    $category = '';
    for ($j=0; $j<count($categories); $j++) {
        if($catId == $categories[$j]['id']) {
            $categoryId = $categories[$j]['id'];
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
        $json .= '"category_id":"'.$categoryId.'",';
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
 * Manipulate Json Response: ORDER
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
        $menu       = json_decode(Menu::where('id',$items[$j]['menu_id'])->get(), true);
        $category   = json_decode(Category::where('id',$menu[0]['category_id'])->get(), true);
        $extra = false;

        if($category[0]['slug'] == 'extra') {
            $extra = true;
        }

        $json .= '{';

        $json .= '"id": "'.$items[$j]['id'].'",';
        //$json .= '"name": "'.$items[$j]['menuname'].'",';
        $json .= '"name": "'.$menu[0]['name'].'",';
        $json .= '"quantity": "'.$items[$j]['quantity'].'",';
        $json .= '"price": "'.$menu[0]['price'].'",';
        $json .= '"total": "'.$items[$j]['total'].'",';
        $json .= '"service": "'.$items[$j]['service'].'",';
        $json .= '"note": "'.$items[$j]['note'].'",';
        $json .= '"state": "'.$items[$j]['statename'].'",';
        $json .= '"isExtra": "'.$extra.'",';
        $json .= '"menu_id": "'.$items[$j]['menu_id'].'",';

        $json = rtrim($json,',');
        $json .= '},';
    }
    $json = rtrim($json,',');
    $json .= '],';

    $json .= '"specials":[';
    for ($j=0; $j<count($specials); $j++) {
        $json .= '{';

        $json .= '"id": "'.$specials[$j]['id'].'",';
        $json .= '"name": "'.$specials[$j]['special'].'",';
        $json .= '"price": "'.$specials[$j]['price'].'",';
        $json .= '"note": "'.$specials[$j]['note'].'",';
        $json .= '"state": "'.$specials[$j]['statename'].'",';

        $json = rtrim($json,',');
        $json .= '},';
    }
    $json = rtrim($json,',');
    $json .= '],';

    $json .= '"notes":[';
    for ($j=0; $j<count($notes); $j++) {
        $json .= '{';

        $json .= '"id": "'.$notes[$j]['id'].'",';
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
 * Manipulate Json Response: NOTIFICATIONS
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseNotifications($jsonData) {
    //$jsonData = str_replace("\\","", $jsonData);
    $notifications = json_decode($jsonData, true);
    
    $json = '{ "results" : [';
    for ($i=0; $i<count($notifications); $i++) {

        $json .= '{';
        $json .= '"id":"'.$notifications[$i]['id'].'",';
        $json .= '"client":"'.$notifications[$i]['client'].'",';
        $json .= '"message":"'.$notifications[$i]['message'].'",';
        $json .= '"read":"'.$notifications[$i]['read'].'",';
        $json .= '"state":"'.$notifications[$i]['state'].'",';
        $json .= '"order_id":"'.$notifications[$i]['order_id'].'"';
        $json .='},';
    }
    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
}

/* ---------------------------------------------------------------------------
 * Check NOTIFICATIONS
 * --------------------------------------------------------------------------- */
function manipulateJsonResponseNotificationsCheck($orderId) {
    $json = '{ "results" : [';

    try{
        $notification = Notification::where('order_id', '=', $orderId)->first();
        $notification->read = 1;
        $notification->save();
        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"'.$orderId.'"';
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

/* ---------------------------------------------------------------------------
 * Save: ORDER
 * --------------------------------------------------------------------------- */
function saveOrder($request) {
    $order = json_decode($request, true);

    /*
    print '<pre>';
    print_r($order);
    print '</pre>';
    die();
    */

    $json = '{ "results" : [';

    try{
        if($order['id'] == 0) {
            $orderSave = new Order();
            $orderSave->date            = $order['date']; 
            $orderSave->client          = $order['client']; 
            $orderSave->totalorder      = $order['totalorder']; 
            $orderSave->totalservice    = $order['totalservice']; 

            $states = State::all();
            for ($j=0; $j<count($states); $j++) {
                if($order['state'] == $states[$j]['state']) {
                    $orderSave->state_id = $states[$j]['id']; 
                }
            }

            $orderSave->save();
            $lastInsertedOrderId = $orderSave->id;
        } else {
            $orderSave = Order::find($order['id']);
            $lastInsertedOrderId = $orderSave->id;
        }

        /*
        print '<pre>';
        print_r($order);
        print '<hr />';
        print_r($orderSave);
        print '</pre>';
        die();
        */        

        try{

            foreach ($order['items'] as $item) {
                $product = new Item();
                //$product->id        = $item['id'];          
                $product->menu_id   = $item['menu_id'];
                $product->quantity  = $item['quantity'];
                $product->total     = $item['total'];
                $product->service   = $item['service'];
                $product->note      = $item['note'];
                $product->order_id  = $lastInsertedOrderId;
                $product->state_id  = $item['state_id'];
                $product->menuname  = $item['menuname'];
                $product->statename = $item['statename'];

                $product->save();
            };

            foreach ($order['specials'] as $item) {
                $special = new Special();
                //$special->id        = $item['id'];
                $special->special   = $item['special'];
                $special->price     = $item['price'];
                $special->note      = $item['note'];
                $special->order_id  = $lastInsertedOrderId;
                $special->state_id  = $item['state_id'];
                $special->statename = $item['statename'];

                $special->save();
            };

            foreach ($order['notes'] as $item) {
                $note = new Note();
                //$note->id        = $item['id'];
                $note->note      = $item['note'];
                $note->order_id  = $lastInsertedOrderId;

                $note->save();
            };

            $json .= '{';
                $json .= '"operation":"success",';
                $json .= '"message":"'.$lastInsertedOrderId.'"';
            $json .='},';

        }
        catch(Exception $e){
            $json .= '{';
                $json .= '"operation":"error",';
                $json .= '"message":"'.$e->getMessage().'"';
            $json .='},';
        }
    
    }
    catch(Exception $e){
        $json .= '{';
            $json .= '"operation":"error",';
            $json .= '"message":"'.$e->getMessage().'"';
        $json .='},';
    }

    //Recalculate TOTAL ORDER
    recalculateTotalOrder($lastInsertedOrderId);

    if($order['id'] == 0) {
        $notification = new Notification();
        $notification->order_id = $lastInsertedOrderId;
        $notification->client  = $order['client'];
        $notification->message  = 'Nuova ordinazione';
        $notification->state    = 'new'; //new | update | delete | change
    } else {
        $notification = Notification::where('order_id', '=', $lastInsertedOrderId)->first();
        if($notification == '') {
            $notification = new Notification();
            $notification->client  = 'Client';
            $notification->order_id  = $lastInsertedOrderId;
        }
        $notification->message  = 'Ordinazione aggiornata';
        $notification->state    = 'update'; //new | update | delete | change
    }
    $notification->read    = 0;
    $notification->save();

    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
    
}
/* ---------------------------------------------------------------------------
 * Change state: ORDER
 * --------------------------------------------------------------------------- */
function changeStateOrder($orderId) {
    $json = '{ "results" : [';

    try{
        $itemChange = Order::find($orderId);
        $itemChange->state_id   = 2;
        $itemChange->save();
        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"'.$orderId.'"';
        $json .='},';

    }
    catch(Exception $e){
        $json .= '{';
            $json .= '"operation":"error",';
            $json .= '"message":"'.$e->getMessage().'"';
        $json .='},';
    }

    $notification = Notification::where('order_id', '=', $orderId)->first();
    if($notification == '') {
        $notification = new Notification();
        $notification->client  = 'Client';
        $notification->order_id  = $orderId;
    }
    $notification->message  = 'Ordinazione: stato modificato';
    $notification->state    = 'change'; //new | update | delete | change
    $notification->read     = 0;
    $notification->save();

    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
    
}
/* ---------------------------------------------------------------------------
 * Delete: ORDER
 * --------------------------------------------------------------------------- */
function deleteOrder($orderId) {
    $json = '{ "results" : [';

    try{
        $orderDelete = Order::find($orderId);
        $orderDelete->delete();
        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"'.$orderId.'"';
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

/* ---------------------------------------------------------------------------
 * Change state: ITEM
 * --------------------------------------------------------------------------- */
function changeStateItem($itemId,$orderId) {
    $json = '{ "results" : [';

    try{
        $itemChange = Item::find($itemId);
        $itemChange->state_id   = 2;
        $itemChange->statename  = 'completed';
        $itemChange->save();
        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"'.$itemId.'"';
        $json .='},';

    }
    catch(Exception $e){
        $json .= '{';
            $json .= '"operation":"error",';
            $json .= '"message":"'.$e->getMessage().'"';
        $json .='},';
    }

    $notification = Notification::where('order_id', '=', $orderId)->first();
    if($notification == '') {
        $notification = new Notification();
        $notification->client  = 'Client';
        $notification->order_id  = $orderId;
    }
    $notification->message  = 'Ordinazione: stato piatto cambiato';
    $notification->state    = 'change'; //new | update | delete | change
    $notification->read     = 0;
    $notification->save();

    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
    
}
/* ---------------------------------------------------------------------------
 * Delete: ITEM
 * --------------------------------------------------------------------------- */
function deleteItem($itemId,$orderId) {
    $json = '{ "results" : [';

    try{
        $itemDelete = Item::find($itemId);
        $itemDelete->delete();
        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"'.$itemId.'"';
        $json .='},';

    }
    catch(Exception $e){
        $json .= '{';
            $json .= '"operation":"error",';
            $json .= '"message":"'.$e->getMessage().'"';
        $json .='},';
    }

    //Recalculate TOTAL ORDER
    recalculateTotalOrder($orderId);

    $notification = Notification::where('order_id', '=', $orderId)->first();
    if($notification == '') {
        $notification = new Notification();
        $notification->client  = 'Client';
        $notification->order_id  = $orderId;
    }
    $notification->message  = 'Ordinazione: prodotto eliminato';
    $notification->state    = 'delete'; //new | update | delete | change
    $notification->read     = 0;
    $notification->save();

    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
    
}

/* ---------------------------------------------------------------------------
 * Change state: SPECIAL
 * --------------------------------------------------------------------------- */
function changeStateSpecial($itemId,$orderId) {
    $json = '{ "results" : [';

    try{
        $itemChange = Special::find($itemId);
        $itemChange->state_id   = 2;
        $itemChange->statename  = 'completed';
        $itemChange->save();
        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"'.$itemId.'"';
        $json .='},';

    }
    catch(Exception $e){
        $json .= '{';
            $json .= '"operation":"error",';
            $json .= '"message":"'.$e->getMessage().'"';
        $json .='},';
    }

    $notification = Notification::where('order_id', '=', $orderId)->first();
    if($notification == '') {
        $notification = new Notification();
        $notification->client  = 'Client';
        $notification->order_id  = $orderId;
    }
    $notification->message  = 'Ordinazione: stato speciale cambiato';
    $notification->state    = 'change'; //new | update | delete | change
    $notification->read     = 0;
    $notification->save();

    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
    
}
/* ---------------------------------------------------------------------------
 * Delete: SPECIAL
 * --------------------------------------------------------------------------- */
function deleteSpecial($specialId,$orderId) {
    $json = '{ "results" : [';

    try{
        $specialDelete = Special::find($specialId);
        $specialDelete->delete();
        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"'.$specialId.'"';
        $json .='},';

    }
    catch(Exception $e){
        $json .= '{';
            $json .= '"operation":"error",';
            $json .= '"message":"'.$e->getMessage().'"';
        $json .='},';
    }

    //Recalculate TOTAL ORDER
    recalculateTotalOrder($orderId);

    $notification = Notification::where('order_id', '=', $orderId)->first();
    if($notification == '') {
        $notification = new Notification();
        $notification->client  = 'Client';
        $notification->order_id  = $orderId;
    }
    $notification->message  = 'Ordinazione: speciale eliminato';
    $notification->state    = 'delete'; //new | update | delete | change
    $notification->read     = 0;
    $notification->save();

    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
    
}

/* ---------------------------------------------------------------------------
 * Delete: NOTE
 * --------------------------------------------------------------------------- */
function deleteNote($noteId,$orderId) {
    $json = '{ "results" : [';

    try{
        $noteDelete = Note::find($noteId);
        $noteDelete->delete();
        $json .= '{';
            $json .= '"operation":"success",';
            $json .= '"message":"'.$noteId.'"';
        $json .='},';

    }
    catch(Exception $e){
        $json .= '{';
            $json .= '"operation":"error",';
            $json .= '"message":"'.$e->getMessage().'"';
        $json .='},';
    }

    $notification = Notification::where('order_id', '=', $orderId)->first();
    if($notification == '') {
        $notification = new Notification();
        $notification->client  = 'Client';
        $notification->order_id  = $orderId;
    }
    $notification->message  = 'Ordinazione: nota eliminata';
    $notification->state    = 'delete'; //new | update | delete | change
    $notification->read     = 0;
    $notification->save();

    $json = rtrim($json,',');
    $json .= ']}';

    return $json;
    
}

/* ---------------------------------------------------------------------------
 * Recalculate TOTAL ORDER
 * --------------------------------------------------------------------------- */
function recalculateTotalOrder($orderId) {
    $order      = Order::find($orderId);
    $items      = Order::find($orderId)->items;
    $specials   = Order::find($orderId)->specials;

    $totalOrder = 0;

    foreach ($items as $item) {
        //print $item['total'].'<br />';
        $totalOrder += $item['total'];
    };

    foreach ($specials as $item) {
        //print $item['price'].'<br />';
        $totalOrder += $item['price'];
    };

    $order->totalorder      = $totalOrder;
    $order->totalservice    = $totalOrder * 10 / 100;

    //Save ORDER
    $order->save();
}