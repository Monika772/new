<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'user_address';

    protected $fillable = ['id','user_id','address','pincode','latitude','longitude','status','is_primary','created_at','updated_at'];
    
    public function useraddress(){
        return $this->hasOne('App\Models\User','id','user_id');
    }
}