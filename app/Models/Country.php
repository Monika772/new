<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Country extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'country';

    protected $fillable = ['id','code','name','status','created_at','updated_at'];
   
}