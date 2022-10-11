<?php

use Illuminate\Http\Request;
use App\Http\Controllers\Api\SettingController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\CommonController;
use App\Http\Controllers\Api\GigsController;
use App\Http\Controllers\Api\EmployeeController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\AddressController;
use App\Http\Controllers\Api\DashboardController;
use Illuminate\Support\Facades\Route;
/*header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: *');*/
Route::post('singup', [AuthController::class, 'singup'])->name('singup');

Route::group(['namespace' => 'Api'], function () {
  Route::get('test-notification', [CommonController::class, 'testNotification'])->name('test-notification');
  
  Route::get('setting', [SettingController::class, 'setting'])->name('setting');
 
  Route::post('login', [AuthController::class, 'login'])->name('login');
  Route::post('send_otp', [AuthController::class, 'sendOTP'])->name('send_otp');
  Route::post('upload-image', [CommonController::class, 'uploadImage'])->name('upload-image');
  Route::post('upload-file', [CommonController::class, 'uploadFile'])->name('upload-file');
  Route::post('delete-temp-image', [CommonController::class, 'deleteTempImage'])->name('delete-temp-image');
  
    // CMS Routes
    Route::get('privacy-policy', [CommonController::class, 'privacyPolicy'])->name('privacy-policy');
    Route::get('terms-condition', [CommonController::class, 'termsCondition'])->name('terms-condition');
    Route::get('about-us', [CommonController::class, 'aboutUs'])->name('about-us');

  Route::middleware('APIToken')->group(function () {
     Route::post('delete-image', [CommonController::class, 'deleteImage'])->name('delete-image');
     Route::post('verify_otp', [AuthController::class, 'verifyOTP'])->name('verify_otp');
     Route::post('v1/verify_otp', [AuthController::class, 'verifyOTPV1'])->name('verify_otp');
     Route::post('register', [ProfileController::class,'register'])->name('register');
     Route::get('dashboard', [DashboardController::class, 'dashboard'])->name('dashboard');
     Route::get('category', [CommonController::class, 'category'])->name('category');
     Route::get('products', [CommonController::class, 'products'])->name('products');
     Route::get('profile', [ProfileController::class, 'getProfile'])->name('profile');
     Route::post('update_profile', [ProfileController::class,'updateProfile'])->name('update_profile');
     Route::get('address', [AddressController::class,'address'])->name('address');
     Route::post('update_useraddress', [AddressController::class,'updateAddress'])->name('update_address');

     Route::get('resend-otp', [ProfileController::class, 'resendOtp'])->name('resend-otp');

     // Common Routes
     Route::post('logout', [AuthController::class, 'logout'])->name('logout');
     Route::get('notifications', [NotificationController::class, 'getNotifications'])->name('notifications');
     Route::get('delete-notification', [NotificationController::class, 'delete'])->name('delete-notification');
    
     Route::get('notification-switch', [ProfileController::class, 'notificationSwitch'])->name('notification-switch');
     Route::post('rating-review', [CommonController::class, 'ratingReview'])->name('rating-review');
     Route::get('faq', [CommonController::class, 'faq'])->name('faq');
     Route::get('contact-subject', [CommonController::class, 'contactSubjects'])->name('contact-subject');
     Route::post('send-contactus', [CommonController::class, 'sendContactUsAdmin'])->name('send-contactus');
     Route::post('save-chat', [CommonController::class, 'saveChat'])->name('save-chat');
     Route::get('get-chat', [CommonController::class, 'getChat'])->name('get-chat');
   
     
     

    
  
  });
});