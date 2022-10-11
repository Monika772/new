<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class ContactSubjects extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'contact_subjects';

    protected $fillable = ['id','name','role','status','created_at','updated_at'];
    
}