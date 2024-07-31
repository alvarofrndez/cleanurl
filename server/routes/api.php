<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ShortUrlController;


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

// CheckStatus
Route::get('/checkStatus', [AuthController::class, 'checkStatus']);

// Get user
Route::middleware('auth:sanctum')->get('/user', [AuthController::class, 'user']);

// Login user
Route::post('/login', [AuthController::class, 'login']);

// Logout user
Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);

// Singin user
Route::post('/singin', [UserController::class, 'singin']);

// Get all urls of the user
Route::middleware('auth:sanctum')->get('/getAllUrls', [UserController::class, 'getAllUrls']);

// short url
Route::middleware('auth:sanctum')->post('/shorten', [ShortUrlController::class, 'shorten']);

// redirect to url
Route::get('/{shortCode}', [ShortUrlController::class, 'redirect']);