<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmployersBusiness extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'employers_business';

    protected $fillable = ['id','user_id','category_id','business_name','business_address','latitude','longitude','status','created_at','updated_at'];
    public function businessImages(){
        return $this->hasMany('App\Models\BusinessImages','business_id','id');
    }
    public function category(){
        return $this->hasOne('App\Models\Category','id','category_id');
    }
}