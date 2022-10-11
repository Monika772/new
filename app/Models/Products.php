<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Helpers\CommonHelper;


class Products extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'products';

    protected $fillable = ['id','categories_id','sub_categories_id','name_en','name_hindi','product_code','tax_id','status','description_hindi','description_en','created_at','updated_at'];
    protected $appends = ['total_variants'];
    public function getTotalVariantsAttribute(){
        return CommonHelper::getProductVariantsCount($this->id);
     }
     public function scopeNotDeleted($query){
        $query->where('status', '!=','deleted');
    }
    public function scopeIsActive($query){
        $query->where('status','active');
    }
    public function image(){
        return $this->hasOne('App\Models\ProductImage','product_id','id');
    }
    public function Taxcategory(){
        return $this->hasOne('App\Models\TaxCategory','id','tax_id');
    }
    public function category(){
        return $this->hasOne('App\Models\Category','id','categories_id');
    }
    public function subcategory(){
        return $this->hasOne('App\Models\SubCategory','id','sub_categories_id');
    }
}
