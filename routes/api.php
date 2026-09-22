<?php

use App\Http\Controllers\Api\CharactersController;
use App\Http\Controllers\Api\ComicController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\PaymentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('comics', [ComicController::class, 'index']);

Route::get('comics/{comic}', [ComicController::class, 'show']);

Route::get('characters', [CharactersController::class, 'index']);

Route::get('characters/{character}', [CharactersController::class, 'show']);

Route::post('/orders', [OrderController::class, 'store']);

Route::post('/orders/{order}/payment-intent', [PaymentController::class, 'createIntent']);

Route::get('/orders/{order}', [OrderController::class, 'show']);
