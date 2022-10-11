<?php

use App\Http\Controllers\Website\TransactionController;
Route::group(['namespace' => 'transactions'], function () {

    Route::get('transactions', [TransactionController::class, 'index']);
    Route::get('transactions/getData', [TransactionController::class, 'getData'])->name('transactions.getData');

});