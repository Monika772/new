<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class AppContactUs extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'app_contactus';

    protected $fillable = ['id','user_id','subject_id','message','created_at','updated_at'];
    
}