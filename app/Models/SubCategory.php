<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'sub_categories';

    protected $fillable = ['categories_id','name_en','name_hindi','status','created_at','updated_at','image'];
    protected $appends = ['image_url'];
    public function getImageUrlAttribute(){
        return CommonHelper::getImageFullUrl('subcategory',$this->image);
    }
    public function scopeNotDeleted($query){
        $query->where('status', '!=','deleted');
    }
    public function scopeIsActive($query){
        $query->where('status','active');
    }
    public function categories(){
        return $this->hasOne('App\Models\Category','id','categories_id');
    }
}
