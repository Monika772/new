<?php

use App\Http\Controllers\Website\User\CustomerController;
Route::group(['namespace' => 'User'], function () {

	Route::get('customer', [CustomerController::class, 'index'])->name('customer');
	Route::get('customer/getData', [CustomerController::class, 'getData'])->name('customer.getData');
	Route::get('customer/create', [CustomerController::class, 'create'])->name('customer.create');
	Route::post('customer/store', [CustomerController::class, 'store'])->name('customer.store');
	Route::get('customer/edit/{id}', [CustomerController::class, 'edit'])->name('customer.edit');
	Route::get('customer/edit_address/{id}', [CustomerController::class, 'edit_address'])->name('customer.edit_address');
	Route::post('customer/update/{id}', [CustomerController::class, 'update'])->name('customer.update');
	Route::post('customer/update_address/{id}', [CustomerController::class, 'update_address'])->name('customer.update_address');
	Route::get('customer/deleted/{id}', [CustomerController::class, 'deleted'])->name('customer.deleted');
	Route::get('customer/display/{id}', [CustomerController::class, 'display'])->name('customer.display');
	Route::get('customer/aprove_document/{id}', [CustomerController::class, 'aprove_doc'])->name('customer.aprove_document');
	Route::get('customer/reject_document/{id}', [CustomerController::class, 'reject_doc'])->name('customer.reject_document');
	


});


