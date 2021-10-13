<?php

use App\Http\Controllers\FoodController;
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

Route::get('/',[FoodController::class,'index']);
Route::get('/menu',[FoodController::class,'menu']);
Route::post('/menu',[FoodController::class,'store']);
Route::get('/menu/{id}/edit',[FoodController::class,'edit']);
Route::put('/menu/{id}',[FoodController::class,'update']);

