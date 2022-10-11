<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FAQ extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'faq';

    protected $fillable = ['id','role_type','question','answer','status','created_at','updated_at'];
    protected $appends = ['user_role','faq_status'];
    public function getUserRoleAttribute(){
        return !empty($this->role_type)?ucfirst($this->role_type):'';
    }
    public function getFaqStatusAttribute(){
        return !empty($this->status)?ucfirst($this->status):'';
    }
}