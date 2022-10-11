<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderProducts extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'order_products';
    protected $fillable = ['quantity','product_id','variant_id','per_unit_price','status','created_at','updated_at'];
}
