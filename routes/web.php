<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ImportController;
use App\Http\Controllers\DialerController;
use App\Http\Controllers\SuppressionGroupController;
use App\Http\Controllers\SuppressionAssignController;
use App\Http\Controllers\QuestionSuppressionController;

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

Route::get('/cdn-crm', [DialerController::class, 'index'])->name('cdn-get');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});


Route::group(['prefix' => 'admin','as' => 'voyager.', 'middleware' => 'admin.user'], function () {
    Route::get('dialer/import', [ImportController::class, 'form'])->name('dialer.import.form');
    Route::post('dialer/import', [ImportController::class, 'submit'])->name('dialer.import.submit');
    Route::get('dialer/truncate', [ImportController::class, 'truncate'])->name('dialer.truncate');
    
    Route::get('suppression/upload', [SuppressionGroupController::class, 'index'])->name('suppression.upload');
    Route::post('suppression/upload', [SuppressionGroupController::class, 'store'])->name('suppression.upload.submit');

    Route::get('assign/suppression', [SuppressionAssignController::class, 'index'])->name('suppression.assign.index');
    Route::get('assign/suppression/{database}', [SuppressionAssignController::class, 'index'])->name('suppression.assign.withdb');

    Route::post('assign', [QuestionSuppressionController::class, 'store'])->name('suppression.assign');
});


Route::get('/suppression/get_suppression/{data}', [QuestionSuppressionController::class, 'index'])->name('get.suppression.api');
/* https://dbi-suppression.test/suppression/get_suppression/*/