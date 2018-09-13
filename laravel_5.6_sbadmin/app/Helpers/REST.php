<?php
/*
|--------------------------------------------------------------------------
| Helper Service REST
|--------------------------------------------------------------------------
|
| REST functions for project
|
*/

/* ---------------------------------------------------------------------------
 * Json Model: APPS
 * --------------------------------------------------------------------------- */
use App\User;

/* ---------------------------------------------------------------------------
 * Json Response: AUTH
 * --------------------------------------------------------------------------- */
function jsonResponseAuth($email,$password) {
    $users = User::all();
    $json = '';

    if (Auth::attempt(['email' => $email, 'password' => $password])) {
        $user = Auth::user();
        $json .= '{';
        $json .= '"logged":"autenticated",';
        $json .= '"email":"'.$email.'",';
        $json .= '"api_token":"'.$user['api_token'].'",';
        $json .= '"name":"'.$user['name'].'",';
        $json .= '"role":"'.$user['role'].'"';
        $json .='}';
    } else {
        $json .= '{';
        $json .= '"logged":"failed"';
        $json .='}';
    }

    return $json;
}