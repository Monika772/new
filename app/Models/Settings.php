<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Settings extends Model{

    protected $primaryKey = 'id';
    protected $table = 'settings';
    protected $fillable = ['id','name','value','description','status','created_at','updated_at'];
   
}