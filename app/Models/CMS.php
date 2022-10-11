<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CMS extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'cms';

    protected $fillable = ['id','slug','title_hindi','content_hindi','title_en','content_en','created_at','updated_at'];
    
}