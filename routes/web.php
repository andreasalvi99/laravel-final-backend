<?php

use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\CharacterController;
use App\Http\Controllers\Admin\ComicController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/comics', function () {
    return 'FUNZIONA COMICS';
});

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/comics-test', function () {
    return 'COMICS ROUTE OK';
});

Route::get('/comics', function () {
    return 'COMICS INDEX TEST';
});

Route::resource('comics', ComicController::class);

Route::resource('brands', BrandController::class);

Route::resource('characters', CharacterController::class);

    Route::get('/test', function () {
    return 'OK';
});

require __DIR__.'/auth.php';
