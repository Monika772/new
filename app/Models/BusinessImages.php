<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BusinessImages extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'business_images';

    protected $fillable = ['id','user_id','business_id','image','status','created_at','updated_at'];
    protected $appends = ['business_image'];
    public function getBusinessImageAttribute(){
        $image ='';
        if(isset($this->image) && !empty($this->image)){
            $image =  url('storage/app').'/business_profile/'.$this->image; 
        }
        return $image;
    }
}