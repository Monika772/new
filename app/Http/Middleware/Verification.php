<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Redirect;
/*use App\Models\MrCnMapping;
use Illuminate\Support\Facades\Crypt;*/

class Verification
{
  public function handle($request, Closure $next)
  {

    $user_id = Auth::user()->id;
    $user_record = user::select('mobile_verify_status')->where('id',$user_id)->first();
    
    if(($user_record->mobile_verify_status != 1)){

      return Redirect('verification');
    }
    return $next($request);
  }

}