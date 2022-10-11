<?php

namespace App\Models;
use App\Helpers\CommonHelper;
use Illuminate\Database\Eloquent\Model;

class Gigs extends Model{

    protected  $primaryKey = 'id';
    protected $table = 'gigs';

    protected $fillable = ['id','gigs_id','employer_id','employee_id','business_id','gig_address','gigs_latitude','gigs_longitude','gigrr_type','gig_name','estimate_amount','gigs_start_date','gigs_end_date','state_id','city_id','gigs_starttime','gigs_endtime','price_criteria','from_amount','to_amount','status','created_at','updated_at','gender'];
    protected $appends = ['duration','skills','roster_count'];
    public function getDurationAttribute(){
        if(isset($this->gigs_start_date) &&!empty($this->gigs_end_date)){
            return CommonHelper::getDaysBetweenTwoDates($this->gigs_start_date,$this->gigs_end_date);
        }
        return "";
    }
    public function getRosterCountAttribute(){
        return CommonHelper::getGigRosterCount($this->id);
     }
    public function scopeNotDeleted($query){
        $query->where('status', '!=','deleted');
    }
    public function getSkillsAttribute(){
        if(isset($this->gigrr_type) &&!empty($this->gigrr_type)){
            return CommonHelper::getGigrrTypes($this->gigrr_type);
        }
        return "";
        
     }
    public function gigrrBusiness(){
        return $this->hasOne('App\Models\EmployersBusiness','user_id','employer_id');
    }
    public function gigrrTypes(){
        return $this->hasMany('App\Models\GiggrTypes','id','gigrr_type');
    }
    public function employer(){
        return $this->hasOne('App\User','id','employer_id');
    }
    public function employee(){
        return $this->hasOne('App\User','id','employee_id');
    }
    public function category(){
        return $this->hasOne('App\Models\Category','id','category_id');
    }
    public function gigsRequest(){
        return $this->hasMany('App\Models\GigsRequest','gigs_id');
    }
    public function gigsRequestDetails(){
        return $this->hasMany('App\Models\GigsRequest','gigs_id')->select('id','gigs_id','employe_id','status');
    }
}