<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GiggrTypes extends Model
{

    protected  $primaryKey = 'id';
    protected $table = 'gigrr_types';
    protected $fillable = ['id','name','status','created_at','updated_at'];
   
}