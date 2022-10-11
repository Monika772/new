<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Validator;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
       
        Validator::extend('check_current_password', function ($attribute, $value, $parameters, $validator) {
            $user_id = Auth::user()->id;
            $user = user::where('id',$user_id)->first();
           if(Hash::check($value, $user->password)){
               return true;
           }
           return false;
        });
    }
}
