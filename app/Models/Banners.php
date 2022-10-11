<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class Banners extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'banners';

    protected $fillable = ['id','image','status','created_at','updated_at'];
    protected $appends = ['image_url'];
    public function getImageUrlAttribute(){
        return CommonHelper::getImageFullUrl('banners',$this->image);
    }
}
