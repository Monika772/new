<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class GigsLoginLogout extends Model
{

    protected  $primaryKey = 'id';
    protected $table = 'gigs_login_logout';
    protected $fillable = ['id','gigs_id','candidate_id','login','logout','minutes','created_at','updated_at'];
    
}