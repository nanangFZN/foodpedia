<?php

use App\Http\Controllers\FoodApiController;
use App\Http\Controllers\UserApiController;
use App\Http\Controllers\XenditController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/menu',[FoodApiController::class,'index']);
Route::get('menu/{id}',[FoodApiController::class,'filter']);
Route::post('/menu',[FoodApiController::class,'store']);
Route::get('/menu/edit/{id}',[FoodApiController::class,'edit']);
Route::post('/menu/register',[FoodApiController::class,'userRegist']);
Route::post('/menu/login',[FoodApiController::class,'userLogin']);
Route::get('/menu/cart/{id}',[FoodApiController::class,'userCart']);
Route::get('/user/{id}',[UserApiController::class,'index']);
Route::put('/user/edit/{id}',[UserApiController::class,'update']);
Route::get('/xendit',[XenditController::class,'index']);
