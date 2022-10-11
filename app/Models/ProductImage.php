<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Helpers\CommonHelper;

class ProductImage extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'product_images';
    protected $fillable = ['product_id','image_name','status'];
    protected $appends = ['image_url'];
    public function getImageUrlAttribute(){
        return CommonHelper::getImageFullUrl('products',$this->image_name);
    }
    
   
    
}
