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

Route::resource('categories','CategoriesController');
Route::resource('menu','MenuController');
Route::resource('orders','OrdersController');
Route::resource('items','ItemsController');
Route::resource('specials','SpecialsController');
Route::resource('notes','NotesController');
Route::resource('extra','ExtraController');
Route::resource('state','StateController');
Route::resource('users','UsersController');

//JSON response
Route::get('/json', function () {
    return view('json');
});

use App\Category;
use App\Menu;
use App\Order;
use App\Item;
use App\Special;
use App\Note;
use App\Extra;
use App\State;
use App\User;

use Illuminate\Http\Request;

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
Route::get('jsondata/orders', function(){
    return manipulateJsonResponseOrders(Order::all(),State::all());
});
Route::get('jsondata/order/{orderId}', function($orderId){
    $order      = Order::find($orderId);
    $items      = Order::find($orderId)->items;
    $specials   = Order::find($orderId)->specials;
    $notes      = Order::find($orderId)->notes;

    return manipulateJsonResponseOrder($order,$items,$specials,$notes);
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

/*** TEST ***/
Route::get('jsondata/save/state/{request}', function($request){
    return saveState($request);
});