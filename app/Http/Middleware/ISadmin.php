<?php

namespace App\Http\Middleware;

use Closure;
use Session;
use Auth;
use App\Models\Permissions;
class ISadmin
{

   public function __construct(){
    
    }
   public function handle($request, Closure $next)
   {
   
    
        if (Auth()->user()->role_id != '1'){
         $permissions = Auth()->user()->permissions;
        
         $arr = explode(",",$permissions);
         
         $permission_name =  Permissions::selectRaw('GROUP_CONCAT(route) as routes')
                             ->whereIn('id',$arr)->first();
         $routes = explode(",",$permission_name['routes']);    
                  
         if(in_array(request()->segment(1),['home','profile','logout','settings'])){
            return $next($request);
         }else{
            $routesArr = ['tournaments','teams','players','matches','player-role'];
            if(in_array(request()->segment(1),$routesArr) && !in_array(request()->segment(1),$routes)){
               return redirect('home');
            }
         }
      }
       return $next($request);

   }

}