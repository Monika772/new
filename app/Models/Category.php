<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class Category extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'categories';

    protected $fillable = ['id','name_en','name_hindi','description_en','description_hindi','created_at','updated_at','status','images'];

    protected $appends = ['image_url','products_count'];
    public function getImageUrlAttribute(){
        return CommonHelper::getImageFullUrl('category',$this->images);
    }
    public function getProductsCountAttribute(){
        return CommonHelper::getCategoryProductsCount($this->id);
    }
    public function scopeNotDeleted($query){
        $query->where('status', '!=','deleted');
    }
    public function scopeIsActive($query){
        $query->where('status','active');
    }
}