<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'setting';
    protected $fillable = ['id','encrypted_key','app_version','force_update','is_image','created_at','updated_at'];
   
}