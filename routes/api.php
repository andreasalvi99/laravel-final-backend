<?php

use App\Http\Controllers\Api\ComicController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('comics', [ComicController::class, 'index']);

Route::get('comics/{comic}', [ComicController::class, 'show']);
