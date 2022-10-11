<?php


use App\Http\Controllers\Home_controller;
use App\Http\Controllers\Website\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\SettingController;

// New Controllers
use App\Http\Controllers\GigsController;
use App\Http\Controllers\SubAdminController;
use App\Http\Controllers\EmployersController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\EmployeesController;
use App\Http\Controllers\GigrrTypeController;
use App\Http\Controllers\CMSController;
use App\Http\Controllers\FAQController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ForgotPasswordController;
use App\Http\Controllers\CommonController;

//BannerController
//new updated code
use App\Http\Controllers\TaxCategoryController;
use App\Http\Controllers\SubCategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\BannerController;

use Illuminate\Support\Facades\Auth;
Auth::routes();

Route::get('/', [Home_controller::class, 'index']);
Route::post('/login', [Home_controller::class, 'login'])->name('login');
Route::get('/ForgetSuccess', [Home_controller::class, 'ForgetSuccess'])->name('ForgetSuccess');

// forgot password 28-07-2021
Route::get('/forgotPassword', [Home_controller::class, 'forgotPassword'])->name('forgotPassword') ;
Route::post('reset_link', [Home_controller::class, 'reset_link'])->name('reset_link');
Route::get('reset_password', [Home_controller::class, 'reset_password'])->name('reset_password');
Route::get('terms-conditions', [Home_controller::class, 'termsConditions'])->name('terms-conditions');
Route::get('privacy-policy',   [Home_controller::class, 'privacyPolicy'])->name('privacy-policy');
//====================

Route::get('get_credentials', [Home_controller::class, 'get_credentials'])->name('get_credentials');
Route::post('forget_password', [Home_controller::class, 'forget_password'])->name('forget_password');
Route::get('reset_password', [Home_controller::class, 'reset_password'])->name('reset_password');
Route::post('update_password', [Home_controller::class, 'update_password'])->name('update_password');
Route::get('terms-conditions', [Home_controller::class, 'termsConditions'])->name('terms-conditions');
Route::get('privacy-policy', [Home_controller::class, 'privacyPolicy'])->name('privacy-policy');

Route::group(['namespace' => 'Website', 'as' => 'website.', 'middleware' => ['auth','isadmin']], function () {

    Route::get('/dashbord_data', [HomeController::class, 'dashbord_data'])->name('dashbord_data');

	Route::post('/save-token', [HomeController::class, 'saveToken'])->name('save-token');
	Route::post('/send-notification', [HomeController::class, 'sendNotification'])->name('send.notification');

	Route::get('/amount/getData/{type}', [HomeController::class,'g	etAmountData'])->name('amount.getData');
	Route::get('/earnings/getData/{type}', [HomeController::class,'getEarningsData'])->name('earnings.getData');
	Route::post('/get_notification', [HomeController::class, 'get_notification'])->name('get_notification');
	Route::post('/get_notification_count', [HomeController::class, 'get_notification_count'])->name('get_notification_count');

	Route::get('/logout', [HomeController::class, 'logout'])->name('logout');
	Route::get('/verification', [HomeController::class, 'show_verify'])->name('verification');
	Route::post('/check_verification', [HomeController::class, 'check_verify'])->name('check_verification');
	Route::get('/users', [UserController::class, 'index']);
	Route::get('users/getData', [UserController::class, 'getData'])->name('users.getData');
	Route::get('users/view/{id}', [UserController::class, 'getUsersDetails'])->name('users.view');
	Route::get('/users/users-pdf',[UserController::class,'downloadUserPDF'])->name('users.users-pdf');
	Route::get('/users/users-excel',[UserController::class,'downloadUserExcel'])->name('users.users-excel');
	Route::get('/users/users-import',[UserController::class,'importView'])->name('users.users-import');
	Route::get('/users/status/{id}/{status}', [UserController::class, 'status'])->name('users.status');
	Route::get('users/deleted/{id}', [UserController::class, 'deleted'])->name('users.deleted');
	Route::post('/users/import',[UserController::class,'import'])->name('users.import');

	Route::get('/message', [MessageController::class, 'index'])->name('message');
	Route::post('/message/send-message', [MessageController::class, 'sendMessage'])->name('message.send-message');

	Route::get('settings', [SettingController::class, 'index'])->name('settings');
	Route::get('settings/update_is_image/{status}', [SettingController::class, 'updateIsImageOption'])->name('update_is_image');

	Route::post('settings/update', [SettingController::class, 'update'])->name('settings.update');

	/* Banners Routes */
	Route::get('/banners', [BannerController::class, 'index']);
	Route::get('/banners/getData', [BannerController::class, 'getData'])->name('banners.getData');
	Route::get('/banners/create', [BannerController::class, 'create'])->name('banners.create');
	Route::post('/banners/store', [BannerController::class, 'store'])->name('banners.store');
	Route::get('banners/deleted/{id}', [BannerController::class, 'deleted'])->name('banners.deleted');
	Route::get('/banners/edit/{id}', [BannerController::class, 'edit'])->name('banners.edit');
	Route::post('/banners/update/{id}', [BannerController::class, 'update'])->name('banners.update');
	Route::post('/banners/update', [BannerController::class, 'update'])->name('banners.update');
	Route::get('/banners/status/{id}/{status}', [BannerController::class, 'status'])->name('banners.status');
	

	/* CATEGORY Routes */
	Route::get('/category', [CategoryController::class, 'index']);
	Route::get('/category/getData', [CategoryController::class, 'getData'])->name('category.getData');
	Route::get('/category/create', [CategoryController::class, 'create'])->name('category.create');
	Route::post('/category/store', [CategoryController::class, 'store'])->name('category.store');
	Route::get('category/deleted/{id}', [CategoryController::class, 'deleted'])->name('category.deleted');
	Route::get('/category/edit/{id}', [CategoryController::class, 'edit'])->name('category.edit');
	Route::post('/category/update/{id}', [CategoryController::class, 'update'])->name('category.update');
	Route::post('/category/update', [CategoryController::class, 'update'])->name('category.update');
	Route::get('/category/status/{id}/{status}', [CategoryController::class, 'status'])->name('category.status');
	

	/* Sub CATEGORY Routes */
	Route::get('/subcategory', [SubCategoryController::class, 'index']);
	Route::get('/subcategory/getData', [SubCategoryController::class, 'getData'])->name('subcategory.getData');
	Route::get('/subcategory/create', [SubCategoryController::class, 'create'])->name('subcategory.create');
	Route::post('/subcategory/store', [SubCategoryController::class, 'store'])->name('subcategory.store');
	Route::get('subcategory/deleted/{id}', [SubCategoryController::class, 'deleted'])->name('subcategory.deleted');
	Route::get('/subcategory/edit/{id}', [SubCategoryController::class, 'edit'])->name('subcategory.edit');
	Route::post('/subcategory/update/{id}', [SubCategoryController::class, 'update'])->name('subcategory.update');
	Route::post('/subcategory/update', [SubCategoryController::class, 'update'])->name('subcategory.update');
	Route::get('/subcategory/status/{id}/{status}', [SubCategoryController::class, 'status'])->name('subcategory.status');
	
	//product
	Route::get('/product', [ProductController::class, 'index']);
	Route::get('/product/getData', [ProductController::class, 'getData'])->name('product.getData');
	Route::get('/product/create', [ProductController::class, 'create'])->name('product.create');
	Route::post('/product/store', [ProductController::class, 'store'])->name('product.store');
	Route::get('product/deleted/{id}', [ProductController::class, 'deleted'])->name('product.deleted');
	Route::get('/product/edit/{id}', [ProductController::class, 'edit'])->name('product.edit');
	Route::post('/product/update/{id}', [ProductController::class, 'update'])->name('product.update');
	Route::post('/product/update', [ProductController::class, 'update'])->name('product.update');
	Route::get('/product/status/{id}/{status}', [ProductController::class, 'status'])->name('product.status');
	Route::get('/product/subcategory/{id}', [ProductController::class, 'subcategory'])->name('product.subcategory');
	Route::get('/product/show/{id}', [ProductController::class, 'show'])->name('product.show');

	//variant
	Route::post('/product/variant', [ProductController::class, 'variant'])->name('product.variant');

	
	/* TaxCategory Routes */
	Route::get('/taxcat', [TaxCategoryController::class, 'index']);//getData
	Route::get('/taxcat/getData', [TaxCategoryController::class, 'getData'])->name('taxcat.getData');
	Route::get('/taxcat/create', [TaxCategoryController::class, 'create'])->name('taxcat.create');
	Route::post('/taxcat/store', [TaxCategoryController::class, 'store'])->name('taxcat.store');
	Route::get('taxcat/deleted/{id}', [TaxCategoryController::class, 'deleted'])->name('taxcat.deleted');
	Route::get('/taxcat/status/{id}/{status}', [TaxCategoryController::class, 'status'])->name('taxcat.status');
	Route::get('/taxcat/edit/{id}', [TaxCategoryController::class, 'edit'])->name('taxcat.edit');
	Route::post('/taxcat/update', [TaxCategoryController::class, 'update'])->name('taxcat.update');

	/* Products Management Routes */
	Route::get('/products', [ProductController::class, 'index']);//getData
	Route::get('/products/getData', [ProductController::class, 'getData'])->name('products.getData');
	Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
	Route::post('/products/store', [ProductController::class, 'store'])->name('products.store');
	Route::get('products/deleted/{id}', [ProductController::class, 'deleted'])->name('products.deleted');
	Route::get('/products/status/{id}/{status}', [ProductController::class, 'status'])->name('products.status');
	Route::get('/products/edit/{id}', [ProductController::class, 'edit'])->name('products.edit');
	Route::post('/products/update', [ProductController::class, 'update'])->name('products.update');
	Route::get('/products/subcategory/{id}', [ProductController::class, 'subcategory'])->name('products.subcategory');



	/* Setting Routes */
	Route::get('settings', [SettingController::class, 'index'])->name('settings');
	Route::get('setting/edit/{id}', [SettingController::class, 'edit'])->name('settings.edit');
    Route::post('settings/update', [SettingController::class, 'update'])->name('settings.update');
	/* SubAdmin Routes */
	Route::get('/subadmin', [SubAdminController::class, 'index']);
	Route::get('/subadmin/getData', [SubAdminController::class, 'getData'])->name('subadmin.getData');
	Route::get('/subadmin/create', [SubAdminController::class, 'create'])->name('subadmin.create');
	Route::post('/subadmin/store', [SubAdminController::class, 'store'])->name('subadmin.store');
	Route::get('subadmin/deleted/{id}', [SubAdminController::class, 'deleted'])->name('subadmin.deleted');
	Route::get('/subadmin/edit/{id}', [SubAdminController::class, 'edit'])->name('subadmin.edit');
	Route::post('/subadmin/update/{id}', [SubAdminController::class, 'update'])->name('subadmin.update');
	Route::post('/subadmin/update', [SubAdminController::class, 'update'])->name('subadmin.update');

	Route::get('/subadmin/status/{id}/{status}', [SubAdminController::class, 'status'])->name('subadmin.status');

	/* CMS Routes */
	Route::get('cms', [CMSController::class, 'index'])->name('cms');
	Route::get('/cms/getData', [CMSController::class, 'getData'])->name('cms.getData');
	Route::get('cms/edit/{id}', [CMSController::class, 'edit'])->name('cms.edit');
    Route::post('cms/update', [CMSController::class, 'update'])->name('cms.update');

	/* Payment Route */
	Route::get('payment', [PaymentController::class, 'index'])->name('payment');
	Route::get('/payment/getData', [PaymentController::class, 'getData'])->name('payment.getData');

	Route::get('faq', [FAQController::class, 'index'])->name('faq');
	Route::get('/faq/getData', [FAQController::class, 'getData'])->name('faq.getData');
	Route::get('/faq/create', [FAQController::class, 'create'])->name('faq.create');
	Route::post('faq/create', [FAQController::class, 'store'])->name('faq.create');
	Route::get('faq/edit/{id}', [FAQController::class, 'edit'])->name('faq.edit');
    Route::post('faq/update', [FAQController::class, 'update'])->name('faq.update');
	Route::get('/faq/status/{id}/{status}', [FAQController::class, 'status'])->name('faq.status');
	Route::get('faq/deleted/{id}', [FAQController::class, 'deleted'])->name('faq.deleted');

	//Chat Routes
	Route::get('/common/chat/{id}', [CommonController::class,'chat'])->name('common.chat');
	Route::post('/common/sendMessage/', [CommonController::class,'sendMessage'])->name('common.sendMessage');
	Route::post('/common/getMessage/', [CommonController::class,'getMessage'])->name('common.getMessage');
	Route::get('/chat', [CommonController::class,'loadChat'])->name('chat');

	
	
	
	Route::group(['middleware' => 'verification'], function () {
		include_route_files(__DIR__.'/Website/');
	});


});
