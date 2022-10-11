<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductVariant extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'product_vairant';
    protected $fillable = ['product_id','variant_name','quantity','per_image_price','status'];
}
