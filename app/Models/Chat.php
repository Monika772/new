<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class Chat extends Model{

    protected $primaryKey = 'id';
    protected $table = 'chat';

    protected $fillable = [ 'id','from_user_id','to_user_id','message','gigs_id','created_at','updated_at' ];
    public function chatUser(){
        return $this->hasMany('App\Models\User','id','from_user_id');
    }
    
}