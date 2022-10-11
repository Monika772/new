<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'orders';
    protected $fillable = ['order_id','status','order_amount','user_id','tax_amount','tax_id','total_amount','created_at','updated_at'];
   
    public function orderproduct(){
        return $this->hasOne('App\Models\OrderProducts','id','order_id');
    }
    public function customer(){
        return $this->hasOne('App\Models\User','id','user_id');
    }
}
