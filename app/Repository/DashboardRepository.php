<?php

namespace App\Repository;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\User;
use App\Models\TaxCategory;
use App\Models\SubCategory;
use App\Models\Category;
use App\Models\Products;
use App\Models\Orders;
use Illuminate\Support\Facades\Storage;
use App\Helpers\CommonHelper;
use DB;

class DashboardRepository
{

    public function __construct(){
        $this->user         = new User();
        $this->taxtcat         = new TaxCategory();
        $this->subcat         = new SubCategory();
        $this->cat         = new Category();
        $this->pro  = new Products();
        $this->orders = new Orders();
    }
    /**
     * Function : getDashboradcount
     * Desc : get dashboard count
     */
    public function getDashboradcount(){
        $cat            =   $this->cat->where('status','active')->count();
        $subcat         =   $this->subcat->where('status','active')->count();
        $taxtcat         =   $this->taxtcat->where('status','active')->count();
        $all            =   $this->user->whereIn('role',['user'])->count();
        $subadmin       =   $this->user->where('role', 'subadmin')->count();
        $pro           =    $this->pro->where('status','active')->count();
        $users = $this->user->where('status','active')->orderBy('id', 'desc')->get();
        return ['all' => $all,'subadmin' => $subadmin,'cat'=>$cat,'subcat'=>$subcat,'taxtcat'=>$taxtcat,'pro'=>$pro,'users' => $users];
    }

    /**
     * Function : getData
     * Desc :getData
     */
    public function getData(){
        $users = $this->user->where('status','active')->whereIn('role',['user'])->take(5)->orderBy('id', 'desc')->get();
        return ['users' => $users];
    }

    public function getRecentOrderData(){
        return $this->orders
                ->select('*')
                ->with('orderproduct','customer')
                ->orderBy('id', 'desc')->limit(5)->get();
    }
    

    

    // public function getAmountData($type){
    //     return $this->user
    //                     ->where(function($query) use($type){
    //                         if($type=='today'){
    //                              $query->whereDate('created_at',Carbon::today());
    //                         }elseif($type=='weekly'){
    //                             $query->whereBetween('created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);
    //                         }elseif($type=='monthly'){
    //                             $query->whereMonth('created_at', date('m')); 
    //                         }
    //                     })->sum('id');
    // }

    // public function getEarningsData($type){
    //     return $this->user
    //             ->where(function($query) use($type){
    //                 if($type=='today'){
    //                     $query->whereDate('created_at',Carbon::today());
    //                 }elseif($type=='weekly'){
    //                     $query->whereBetween('created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()]);
    //                 }elseif($type=='monthly'){
    //                     $query->whereMonth('created_at', date('m')); 
    //                 }
    //             })->select(DB::raw('sum(id) AS totalAmount'),DB::raw('sum(id) AS candidateIncome'),DB::raw('sum(id) AS adminIncome'))
    //             ->first();
    // }
}
