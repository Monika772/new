<?php

namespace App\Http\Middleware;
use App\Models\User;
use App\Helpers\CommonHelper;
use Closure;

class APIToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
      
      if($request->header('Authorization')){
        $result = CommonHelper::getUserFromToken($request);
        if(empty($result)){
          return response()->json(['success' => false,'message' => 'Token expired, please login'], 401);
        }
        if($result['status']=="inactive" || $result['status']=="deleted"){
          return response()->json(['status' => '500','message' => 'Your account is inactive by admin, please contact to admin.'], 200);
        }
       
        $request['language'] = 'en';
        if($request->header('language')){
          $request['language'] = $request->header('language');
        }
        $request['user']=$result;
        return $next($request);
      }
      return response()->json([
        'success' => false,
        'message' => 'Token expired, please login'
    ], 401);
    }
}
