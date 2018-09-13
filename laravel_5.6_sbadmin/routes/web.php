<?php

Route::get('/', function () {
    return redirect('admin');
});

Route::get('/admin/{demopage?}', 'DemoController@demo')->name('demo');

/*
|--------------------------------------------------------------------------
| Json REST
|--------------------------------------------------------------------------
*/
Route::get('jsondata/auth/{email}/{password}', function($email,$password){
    return jsonResponseAuth($email,$password);
});