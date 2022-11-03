<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', function () {
    return 'hi, about page';
});

Route::get('/contact/{id}', function ($id) {
    return $id;
});

// named route inside php function
Route::get('/admin/post/get', array('as' => 'admin.postget', function () {

    $url = route('admin.postget');

    return $url;

}));
