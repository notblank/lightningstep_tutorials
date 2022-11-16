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


// Routes Examples:
/*
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
 */

// Routing Controller
/*
Route::get('/post', '\App\Http\Controllers\PostsController@index');

// Passing data
Route::get('/post/{data}', '\App\Http\Controllers\PostsController@index');
 */

// Routing to resource methods inside Controller
// php artisan make:controller --resource
//Route::resource('posts', '\App\Http\Controllers\PostsController');


Route::get('/contact', '\App\Http\Controllers\PostsController@contact');

Route::get('/posts/{id}', '\App\Http\Controllers\PostsController@show_posts');



