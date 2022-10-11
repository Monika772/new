<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    protected  $primaryKey = 'id';
    protected $table = 'review_rating';
    protected $fillable = ['user_id','user_type','to_user_id','gigs_id','rating','comments','updated_at','created_at'];
}