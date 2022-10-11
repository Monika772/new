<?php 


use App\Http\Controllers\Website\TransactionController;
Route::group( ['namespace' => 'transaction'] , function(){
    Route::get('transaction', [TransactionController::class, 'index'])->name('transaction');
    Route::get('transaction/getData', [TransactionController::class, 'getData'])->name('transaction.getData');
    Route::get('transaction/deatil' , [TransactionController::class, 'detailsPage'])->name('transaction.detailsPage');
});