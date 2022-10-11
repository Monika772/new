<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class EmployeeSkills extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'employes_skills';

    protected $fillable = ['id','user_id','skill_id','created_at','updated_at'];
    protected $appends = ['name'];
    public function getNameAttribute(){
        return CommonHelper::getSkillName($this->skill_id);
     }
    public function types(){
        return $this->hasMany('App\Models\GiggrTypes','id','skill_id');
    }

}