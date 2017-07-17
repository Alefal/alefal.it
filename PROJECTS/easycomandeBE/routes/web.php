<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

Route::get('/', function () {
    return view('welcome');
});

Route::get('/logout', function () {
    Auth::logout();
    return redirect('');
});

Route::resource('configurations','ConfigurationsController');
Route::resource('categories','CategoriesController');

Route::get('menu/filter/{categoryId}', 'MenuController@filter');
Route::resource('menu','MenuController');

Route::resource('orders','OrdersController');
Route::resource('items','ItemsController');
Route::resource('specials','SpecialsController');
Route::resource('notes','NotesController');
Route::resource('extra','ExtraController');
Route::resource('state','StateController');
Route::resource('users','UsersController');
Route::resource('notifications','NotificationsController');

//JSON response
Route::get('/json', function () {
    return view('json');
});

use App\Configuration;
use App\Category;
use App\Menu;
use App\Order;
use App\Item;
use App\Special;
use App\Note;
use App\Extra;
use App\State;
use App\User;
use App\Notification;

use Illuminate\Http\Request;

Route::get('jsondata/auth/{email}/{password}', function($email,$password){
    return manipulateJsonResponseAuth($email,$password);
});
Route::get('jsondata/configurations', function(){
    return manipulateJsonResponseConfigurations(Configuration::all());
});
Route::get('jsondata/orders', function(){
    return manipulateJsonResponseOrders(Order::all(),State::all());
});
Route::get('jsondata/notifications', function(){
    return manipulateJsonResponseNotifications(Notification::all());
});

Route::group(['middleware' => ['auth:api']], function () { 

    Route::get('jsondata/categories', function(){
        return manipulateJsonResponseCategories(Category::all());
    });
    Route::get('jsondata/menu', function(){
        return manipulateJsonResponseMenu(Menu::all(),Category::all());
    });
    Route::get('jsondata/menuforcat/{catId}', function($catId){
        $menus = Menu::where('category_id',$catId)->get();
        return manipulateJsonResponseMenuForCategory($menus,Category::all(),$catId);
    });
    
    Route::get('jsondata/order/{orderId}', function($orderId){
        $order      = Order::find($orderId);
        $items      = Order::find($orderId)->items;
        $specials   = Order::find($orderId)->specials;
        $notes      = Order::find($orderId)->notes;

        return manipulateJsonResponseOrder($order,$items,$specials,$notes,State::all());
    });
    Route::get('jsondata/specialsfororder/{orderId}', function($orderId){
        $specials = Special::where('order_id',$orderId)->get();
        return manipulateJsonResponseSpecialsForOrder($specials,Order::all(),$orderId);
    });
    Route::get('jsondata/notesfororder/{orderId}', function($orderId){
        $notes = Note::where('order_id',$orderId)->get();
        return manipulateJsonResponseNotesForOrder($notes,Order::all(),$orderId);
    });
    Route::get('jsondata/extra', function(){
        return manipulateJsonResponseExtra(Extra::all());
    });
    Route::get('jsondata/state', function(){
        return manipulateJsonResponseState(State::all());
    });
    Route::get('jsondata/users', function(){
        return response()->json([
            'results'=>User::all()
        ]);
    });

    /*** NOTIFICATIONS from APP / WEBAPP ***/
    Route::get('jsondata/notifications/check/{orderId}', function($orderId){
        return manipulateJsonResponseNotificationsCheck($orderId);
    });
    /*** Save/Update ORDER from APP / WEBAPP ***/
    Route::get('jsondata/order/save/{request}', function($request){
        return saveOrder($request);
    });
    /*** Change state ORDER from APP / WEBAPP ***/
    Route::get('jsondata/order/change/state/{itemId}', function($itemId){
        return changeStateOrder($itemId);
    });
    /*** Delete ORDER from APP / WEBAPP ***/
    Route::get('jsondata/order/delete/{orderId}', function($orderId){
        return deleteOrder($orderId);
    });

    /*** Change state ITEM from APP / WEBAPP ***/
    Route::get('jsondata/item/change/state/{itemId}/{orderId}', function($itemId,$orderId){
        return changeStateItem($itemId,$orderId);
    });
    /*** Change sort ITEM from APP / WEBAPP ***/    
    Route::get('jsondata/item/change/sort/{itemId}/{sort}', function($itemId,$sort){
        return changeSortItem($itemId,$sort);
    });
    /*** Delete ITEM from APP / WEBAPP ***/
    Route::get('jsondata/item/delete/{itemId}/{orderId}', function($itemId,$orderId){
        return deleteItem($itemId,$orderId);
    });

    /*** Change state SPECIAL from APP / WEBAPP ***/
    Route::get('jsondata/special/change/state/{itemId}/{orderId}', function($itemId,$orderId){
        return changeStateSpecial($itemId,$orderId);
    });
    /*** Change sort ITEM from APP / WEBAPP ***/    
    Route::get('jsondata/special/change/sort/{itemId}/{sort}', function($itemId,$sort){
        return changeSortSpecial($itemId,$sort);
    });
    /*** Delete SPECIAL from APP / WEBAPP ***/
    Route::get('jsondata/special/delete/{specialId}/{orderId}', function($specialId,$orderId){
        return deleteSpecial($specialId,$orderId);
    });
    /*** Delete NOTE from APP / WEBAPP ***/
    Route::get('jsondata/note/delete/{noteId}/{orderId}', function($noteId,$orderId){
        return deleteNote($noteId,$orderId);
    });

    //Stampa il PDF: non funziona se la chiamata arriva da app
    Route::post('jsondata/order/print/{orderId}', function($orderId){
        //end data
        $pdf = App::make('dompdf.wrapper');
        $pdf->loadHTML('
            <style>
            .page-break {
                page-break-after: always;
            }
            </style>
            <h1>Order '.$orderId.'</h1>
            <div class="page-break"></div>
            <h1>Page 2</h1>
        ');
        return $pdf->download('order_'.$orderId.'.pdf');
    });
});