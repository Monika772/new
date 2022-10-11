<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{

    protected  $primaryKey = 'id';
    protected $table = 'notifications';

    protected $fillable = ['id','user_id','gigs_id','type','title','image','message','created_at','updated_at'];
    public function getImageAttribute(){
        return CommonHelper::getUserImageURL($this->user_id);
     }
}